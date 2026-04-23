# TenX Assessment — do not modify this header
"""Pydantic request/response models — the HTTP contract."""
from pydantic import BaseModel, ConfigDict


class Post(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    content: str
    created_at: str
