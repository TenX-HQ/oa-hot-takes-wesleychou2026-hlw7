// TenX Assessment — do not modify this header
import { useState } from 'react'

export default function MatchupView() {
  const [voting, setVoting] = useState(false)

  const onVote = async (winnerId, loserId) => {
    // region: vote-handler
    // TODO: decide sync strategy
    // endregion: vote-handler
  }

  return (
    <div className="matchup">
      <div className="card">
        <p>Post A</p>
        <button disabled={voting} onClick={() => onVote(1, 2)}>Pick this one</button>
      </div>
      <div className="card">
        <p>Post B</p>
        <button disabled={voting} onClick={() => onVote(2, 1)}>Pick this one</button>
      </div>
    </div>
  )
}
