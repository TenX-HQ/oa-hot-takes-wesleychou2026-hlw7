FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/hot-takes-tournament

COPY pyproject.toml README.md ./
COPY backend/ ./backend/
RUN pip install --no-cache-dir -e ".[dev,seed]" && pip install --no-cache-dir tenx-ai

COPY frontend/package*.json ./frontend/
RUN cd frontend && npm install

ENV PYTHONPATH=/workspaces/hot-takes-tournament/backend

RUN set -eux; \
    COMMIT=$(curl -fsSL "https://update.code.visualstudio.com/api/update/linux-x64/stable/latest" \
       | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"); \
    echo "VS Code commit: ${COMMIT}"; \
    test -n "${COMMIT}"; \
    mkdir -p /root/.vscode-server/bin; \
    curl -fsSL "https://update.code.visualstudio.com/commit:${COMMIT}/server-linux-x64/stable" \
       | tar -xz -C /root/.vscode-server/bin/; \
    mv /root/.vscode-server/bin/vscode-server-linux-x64 /root/.vscode-server/bin/${COMMIT}
