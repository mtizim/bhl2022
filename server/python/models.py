from typing import List
from pydantic import BaseModel


class Card(BaseModel):
    min_capacity: int
    cost: int
    image_url: str
    website_url: str
    address: str
    tags: List[str]
    name: str
    description: str