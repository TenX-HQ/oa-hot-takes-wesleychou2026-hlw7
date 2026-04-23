#!/usr/bin/env bash
# First-time push of the Gold Image to GHCR.
# After this runs once, GitHub Actions handles all future pushes automatically.
#
# Credentials are read from .local/.env (gitignored). Add these two lines:
#   GITHUB_PAT=<your-classic-PAT-with-write:packages>
#   GITHUB_USER=<your-github-username>
#
# Or pass them inline: GITHUB_PAT=xxx GITHUB_USER=yyy bash bootstrap-ghcr.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

# Load .local/.env if it exists
ENV_FILE="$REPO_ROOT/.local/.env"
if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

: "${GITHUB_PAT:?Add GITHUB_PAT to .local/.env or pass it inline}"
: "${GITHUB_USER:?Add GITHUB_USER to .local/.env or pass it inline}"

IMAGE="ghcr.io/tenx-hq/hot-takes-tournament:latest"

echo "==> Building image..."
docker build -t "$IMAGE" -f "$REPO_ROOT/.devcontainer/Dockerfile" "$REPO_ROOT"

echo "==> Logging in to GHCR..."
echo "$GITHUB_PAT" | docker login ghcr.io -u "$GITHUB_USER" --password-stdin

echo "==> Pushing $IMAGE..."
docker push "$IMAGE"

echo ""
echo "Done. Complete these two steps in the GitHub UI before pushing commits:"
echo "  1. https://github.com/orgs/TenX-HQ/packages/container/hot-takes-tournament"
echo "     Package Settings → Change visibility → Public"
echo "     Package Settings → Connect Repository → TenX-HQ/hot-takes-tournament"
echo ""
echo "  2. git push origin candidate"
echo "     Then trigger the workflow at:"
echo "     https://github.com/TenX-HQ/hot-takes-tournament/actions/workflows/gold-image.yml"
