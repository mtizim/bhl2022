from typing import Optional, List
from databases import Database
from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from server.python.models import Card

database = Database("sqlite:///server/database.db")


users_database = {}


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
    email: Optional[str] = None
    full_name: Optional[str] = None
    disabled: Optional[bool] = None


class UserInDB(User):
    hashed_password: str


def get_user(db, username: str):
    if username in db:
        user_dict = db[username]
        return UserInDB(**user_dict)


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
    user_dict = users_database.get(form_data.username)
    if not user_dict:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    user = UserInDB(**user_dict)
    hashed_password = fake_hash_password(form_data.password)
    if not hashed_password == user.hashed_password:
        raise HTTPException(status_code=400, detail="Incorrect username or password")

    return {"access_token": user.username, "token_type": "bearer"}


@app.get("/users/me")
async def read_users_me(current_user: User = Depends(get_current_user)):
    return current_user


@app.get("/cards", response_model=Card)
async def get_cards(offset: int, cards_amount: int, money_min: int, money_max: int, min_capacity: int, tags: List[str],
                    current_user: User = Depends(get_current_user)):
    cache_page = 50
    name = current_user.username
    if name not in cache_database or len(cache_database[name]) < offset + cards_amount:
        tag_string = f""
        for tag in tags:
            tag_string = f"{tag_string}, '{tag}'"

        cards = await database.fetch_all(f"SELECT E.* FROM EVENTS E "
                                         f"JOIN TAGS_TO_EVENTS TE ON E.EVENT_ID = TE.EVENT_ID "
                                         f"JOIN TAGS T ON TE.TAG_ID = T.TAG_ID "
                                         f"WHERE T.NAME IN ({tag_string})"
                                         f"AND E.PRICE_RANGE >= {money_min}"
                                         f"AND E.PRICE_RANGE <= {money_max}"
                                         f"AND E.MIN_CAPACITY <= {min_capacity}"
                                         f"AND NOT EXISTS"
                                         f"(SELECT * FROM EVENT_TO_USER EU"
                                         f"JOIN USERS U ON U.USER_ID = EU.USER_ID"
                                         f"WHERE EU.EVENT_ID = E.EVENT_ID AND U.USERNAME = {current_user.username})"
                                         f"LIMIT {cache_page}")
    return cache_database[name][min(len(cache_database), offset):min(offset + cards_amount, len(cache_database))]
