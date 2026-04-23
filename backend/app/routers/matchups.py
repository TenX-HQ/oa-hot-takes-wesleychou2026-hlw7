# TenX Assessment — do not modify this header
"""Endpoints for random matchup retrieval, vote recording, and ranked leaderboard."""
from fastapi import APIRouter, Query, status

# from app.schemas import LeaderboardEntry, Matchup, VoteRequest

router = APIRouter(tags=["matchups"])


@router.get("/matchup")
def get_matchup():
    raise NotImplementedError("")


@router.post("/matchup/vote", status_code=status.HTTP_204_NO_CONTENT)
def record_vote(payload: dict):
    raise NotImplementedError("")


@router.get("/leaderboard")
def get_leaderboard(sort: str = Query("best")):
    # region: leaderboard-dispatch
    # endregion: leaderboard-dispatch

    # region: leaderboard-aggregation
    # endregion: leaderboard-aggregation

    raise NotImplementedError("")
