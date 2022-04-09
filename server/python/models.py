from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel


class Card(BaseModel):
    id: str
    min_capacity: int
    cost: int
    image_url: str
    website_url: str
    address: str
    tags: List[str]
    name: str
    description: str
    start_date: Optional[datetime]
    end_date: Optional[datetime]
