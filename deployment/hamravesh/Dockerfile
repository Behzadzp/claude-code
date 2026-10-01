FROM node:22-bookworm-slim

ARG TZ=UTC

ENV TZ=${TZ}
ENV DEBIAN_FRONTEND=noninteractive

# --------------------------------------------------
# Claude Code
# --------------------------------------------------

ENV CLAUDE_CONFIG_DIR=/home/node/.claude
ENV WORKSPACE_DIR=/workspace
ENV PATH="/home/node/.local/bin:${PATH}"

# --------------------------------------------------
# CloudCLI
# --------------------------------------------------

ENV HOST=0.0.0.0
ENV PORT=3001

# --------------------------------------------------
# Runtime
# --------------------------------------------------

ENV SHELL=/bin/bash
ENV NODE_ENV=production

# --------------------------------------------------
# System packages
# --------------------------------------------------

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    git-lfs \
    gh \
    jq \
    less \
    nano \
    vim \
    unzip \
    zip \
    procps \
    sudo \
    openssh-client \
    ripgrep \
    fzf \
    zsh \
    tini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# --------------------------------------------------
# Application directories
# --------------------------------------------------

RUN mkdir -p \
    /workspace \
    /home/node/.claude \
    && chown -R node:node \
    /workspace \
    /home/node/.claude

# --------------------------------------------------
# Claude Code
# --------------------------------------------------

USER node

WORKDIR /workspace

RUN curl -fsSL https://claude.ai/install.sh | bash

RUN claude --version

# --------------------------------------------------
# CloudCLI
# --------------------------------------------------

USER root

RUN npm install -g @cloudcli-ai/cloudcli

RUN cloudcli --version || true

# --------------------------------------------------
# Runtime user
# --------------------------------------------------

USER node

WORKDIR /workspace

# --------------------------------------------------
# Entrypoint
# --------------------------------------------------

COPY --chown=node:node \
    deployment/hamravesh/entrypoint.sh \
    /usr/local/bin/start-cloudcli.sh

RUN chmod +x /usr/local/bin/start-cloudcli.sh

# --------------------------------------------------
# Network
# --------------------------------------------------

EXPOSE 3001

# --------------------------------------------------
# Init process
# --------------------------------------------------

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["/usr/local/bin/start-cloudcli.sh"]