from pprint import pprint
from typing import Optional, List
from databases import Database
from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from server.python.models import Card
from server.python.filters import Filters
from typing import List
from passlib.hash import pbkdf2_sha256


database = Database("sqlite:///server/database.db")


users_database = {}
cached_database = {}


cache_database = {}


app = FastAPI()


@app.on_event("startup")
async def database_connect():
    await database.connect()
    users = await database.fetch_all("SELECT * FROM USERS")
    for user in users:
        users_database[user[1]] = user[2]


# cleanup, close database connection
@app.on_event("shutdown")
async def database_disconnect():
    await database.disconnect()


def fake_hash_password(password: str):
    return "fakehashed" + password


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


class User(BaseModel):
    username: str


class UserInDB(User):
    hashed_password: str


def get_user(db, username: str):
    if username in db:
        return User(username=username)


def fake_decode_token(token):
    # This doesn't provide any security at all
    # Check the next version
    user = get_user(users_database, token)
    return user


async def get_current_user(token: str = Depends(oauth2_scheme)):
    user = fake_decode_token(token)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user


async def get_user_id_from_username(username: str):
    return await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{username}'")


@app.post("/token")
async def login(form_data: OAuth2PasswordRequestForm = Depends()):
    if form_data.username not in users_database.keys():
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    hashed_password_rows = await database.fetch_all(f"SELECT HASHED_PASSWORD FROM USERS U WHERE U.USERNAME='{form_data.username}'")
    if not pbkdf2_sha256.verify(form_data.password, hashed_password_rows[0][0]):
        raise HTTPException(status_code=400, detail="Incorrect username or password")

    return {"access_token": form_data.username, "token_type": "bearer"}


@app.get("/users/me")
async def read_users_me(current_user: User = Depends(get_current_user)):
    return current_user


@app.get("/cards", response_model=List[Card])
async def get_cards(offset: int, cards_amount: int, money_min: int, money_max: int, min_capacity: int,
                    current_user: User = Depends(get_current_user)):
    name = current_user.username
    if name not in cache_database or offset == 0:
        cards = await database.fetch_all(f"SELECT E.MIN_CAPACITY, E.PRICE_RANGE, E.IMAGE_URL, E.WEBSITE_URL, E.ADDRESS, E.NAME, E.DESCRIPTION, E.EVENT_ID FROM EVENTS E "
                                         f"WHERE E.PRICE_RANGE >= {money_min} "
                                         f"AND E.PRICE_RANGE <= {money_max} "
                                         f"AND E.MIN_CAPACITY <= {min_capacity} "
                                         f"AND NOT EXISTS "
                                         f"(SELECT * FROM EVENT_TO_USER EU "
                                         f"JOIN USERS U ON U.USER_ID = EU.USER_ID "
                                         f"WHERE EU.EVENT_ID = E.EVENT_ID AND U.USERNAME = '{name}') "
                                         f"GROUP BY E.NAME")

        if name not in cache_database:
            cache_database.update({name: []})

        if offset == 0:
            cache_database[name].clear()

        for row in cards:
            tag_rows = await database.fetch_all(f"SELECT T.NAME FROM EVENTS E "
                                            f"JOIN TAGS_TO_EVENTS TE ON E.EVENT_ID = TE.EVENT_ID "
                                            f"JOIN TAGS T ON TE.TAG_ID = T.TAG_ID "
                                            f"WHERE E.NAME = '{row[5]}'")
            tags = []
            for tag_row in tag_rows:
                tags.append(tag_row[0])
            cache_database[name].append(Card(min_capacity=int(row[0]), cost=int(row[1]), image_url=row[2], website_url=row[3], address=row[4], tags=tags, name=row[5], description=row[6], id=row[7]))

    return cache_database[name][min(len(cache_database[name]), offset):min(offset + cards_amount, len(cache_database[name]))]


@app.get("/favorites", response_model=List[Card])
async def get_favorites(current_user: User = Depends(get_current_user)):
    user_id = await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{current_user.username}'")
    cards = await database.fetch_all(
        f"SELECT E.MIN_CAPACITY, E.PRICE_RANGE, E.IMAGE_URL, E.WEBSITE_URL, E.ADDRESS, E.NAME, E.DESCRIPTION, E.EVENT_ID FROM EVENTS E "
        f"JOIN EVENT_TO_USER EU ON E.EVENT_ID = EU.EVENT_ID "
        f"WHERE EU.USER_ID = {user_id[0][0]} AND EU.CHOICE = 1")
    res = []

    for row in cards:
        tag_rows = await database.fetch_all(f"SELECT T.NAME FROM EVENTS E "
                                            f"JOIN TAGS_TO_EVENTS TE ON E.EVENT_ID = TE.EVENT_ID "
                                            f"JOIN TAGS T ON TE.TAG_ID = T.TAG_ID "
                                            f"WHERE E.NAME = '{row[5]}'")
        tags = []
        for tag_row in tag_rows:
            tags.append(tag_row[0])
        res.append(Card(min_capacity=int(row[0]), cost=int(row[1]), image_url=row[2], website_url=row[3], address=row[4], tags=tags, name=row[5], description=row[6], id=row[7]))

    return res


@app.post("/clear_history")
async def clear_history(current_user: User = Depends(get_current_user)):
    user_id = await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{current_user.username}'")
    await database.execute(f"DELETE FROM EVENT_TO_USER WHERE USER_ID={user_id[0][0]}")


@app.post("/register")
async def register_user(form_data: OAuth2PasswordRequestForm = Depends()):
    if form_data.username in users_database:
        raise HTTPException(status_code=409, detail="Username already exists")
    password_hash = pbkdf2_sha256.hash(form_data.password)
    await database.execute(f"INSERT INTO USERS (USERNAME, HASHED_PASSWORD) VALUES ('{form_data.username}', '{password_hash}')")
    users_database.update({form_data.username: password_hash})


async def swipe(event_id: int, choice: int, current_user: User):
    user_id = await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{current_user.username}'")
    if len(user_id) == 1:
        existing = await database.fetch_all(
            f"SELECT EVENT_ID FROM EVENT_TO_USER EU WHERE EU.EVENT_ID={event_id} AND EU.USER_ID={user_id[0][0]}")
        if len(existing) == 0:
            await database.execute(
                f"INSERT INTO EVENT_TO_USER (USER_ID, EVENT_ID, CHOICE) VALUES ({user_id[0][0]}, {event_id}, {choice})")


@app.post("/swipe_right")
async def swipe_right(event_id: int, current_user: User = Depends(get_current_user)):
    await swipe(event_id, 1, current_user)


@app.post("/swipe_left")
async def swipe_left(event_id: int, current_user: User = Depends(get_current_user)):
    await swipe(event_id, 0, current_user)

