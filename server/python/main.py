from pprint import pprint
from typing import Optional, List
from databases import Database
from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from server.python.models import Card
from server.python.filters import Filters
from typing import List


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
    events_database = await database.fetch_all('SELECT * FROM EVENTS')


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


@app.post("/token")
async def login(form_data: OAuth2PasswordRequestForm = Depends()):
    if form_data.username not in users_database.keys():
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    hashed_password = fake_hash_password(form_data.password)
    if not hashed_password == users_database[form_data.username]:
        raise HTTPException(status_code=400, detail="Incorrect username or password")

    return {"access_token": form_data.username, "token_type": "bearer"}


@app.get("/users/me")
async def read_users_me(current_user: User = Depends(get_current_user)):
    return current_user


@app.get("/cards", response_model=List[Card])
async def get_cards(offset: int, cards_amount: int, money_min: int, money_max: int, min_capacity: int,
                    current_user: User = Depends(get_current_user)):
    cache_page = 50
    name = current_user.username
    if name not in cache_database or len(cache_database[name]) < offset + cards_amount:
        cards = await database.fetch_all(f"SELECT E.MIN_CAPACITY, E.PRICE_RANGE, E.IMAGE_URL, E.WEBSITE_URL, E.ADDRESS, E.NAME, E.DESCRIPTION FROM EVENTS E "
                                         f"WHERE E.PRICE_RANGE >= {money_min} "
                                         f"AND E.PRICE_RANGE <= {money_max} "
                                         f"AND E.MIN_CAPACITY <= {min_capacity} "
                                         f"AND NOT EXISTS "
                                         f"(SELECT * FROM EVENT_TO_USER EU "
                                         f"JOIN USERS U ON U.USER_ID = EU.USER_ID "
                                         f"WHERE EU.EVENT_ID = E.EVENT_ID AND U.USERNAME = '{name}') "
                                         f"GROUP BY E.NAME LIMIT {cache_page}")
        print("Fetched new data")
        pprint(cards)

        if name not in cache_database:
            cache_database.update({name: []})

        if offset == 0:
            cache_database[name].clear()

        for row in cards:
            tags = await database.fetch_all(f"SELECT T.NAME FROM EVENTS E "
                                            f"JOIN TAGS_TO_EVENTS TE ON E.EVENT_ID = TE.EVENT_ID "
                                            f"JOIN TAGS T ON TE.TAG_ID = T.TAG_ID "
                                            f"WHERE E.NAME = '{row[5]}'")
            cache_database[name].append(Card(min_capacity=int(row[0]), cost=int(row[1]), image_url=row[2], website_url=row[3], address=row[4], tags=['tag1', 'tag2'], name=row[5], description=row[6]))

    return cache_database[name][min(len(cache_database[name]), offset):min(offset + cards_amount, len(cache_database[name]))]


@app.post("/swipe_right")
async def swipe_right(card: Card, current_user: User = Depends(get_current_user)):
    user_id = await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{current_user.username}'")
    event_id = await database.fetch_all(f"SELECT EVENT_ID FROM EVENTS E WHERE E.NAME='{card.name}'")
    await database.execute(f"INSERT INTO EVENT_TO_USER (USER_ID, EVENT_ID, CHOICE) VALUES ({user_id[0][0]}, {event_id[0][0]}, 1)")


@app.post("/swipe_left")
async def swipe_left(card: Card, current_user: User = Depends(get_current_user)):
    user_id = await database.fetch_all(f"SELECT USER_ID FROM USERS U WHERE U.USERNAME='{current_user.username}'")
    event_id = await database.fetch_all(f"SELECT EVENT_ID FROM EVENTS E WHERE E.NAME='{card.name}'")
    await database.execute(f"INSERT INTO EVENT_TO_USER (USER_ID, EVENT_ID, CHOICE) VALUES ({user_id[0][0]}, {event_id[0][0]}, 0)")

