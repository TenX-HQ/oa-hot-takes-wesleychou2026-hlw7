# TenX Assessment — do not modify this header
"""Endpoints for listing posts (anchor, read-only) and creating new posts."""
from fastapi import APIRouter, status

from app.database import connection
from app.schemas import Post
# from app.schemas import PostCreate  # add this after defining PostCreate

router = APIRouter(tags=["posts"])


@router.get("/posts", response_model=list[Post])
def list_posts() -> list[Post]:
    with connection() as conn:
        rows = conn.execute(
            "SELECT id, content, created_at FROM posts ORDER BY id"
        ).fetchall()
    return [Post(id=r["id"], content=r["content"], created_at=r["created_at"]) for r in rows]


@router.post("/posts", response_model=Post, status_code=status.HTTP_201_CREATED)
def create_post(payload: dict) -> Post:
    raise NotImplementedError("")
