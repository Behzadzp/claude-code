# Claude Code + CloudCLI - Hamrosh Deployment

This directory contains the deployment configuration for running
Claude Code and CloudCLI as a Docker application on Hamrosh.

## Components

- Claude Code
- CloudCLI
- Node.js 22
- Required CLI and system tools

## Runtime

CloudCLI listens on port 3001.

Claude Code uses the configured Anthropic-compatible gateway.

## Persistent paths

- /home/node/.claude
- /workspace

## Required runtime environment

- CLAUDE_CONFIG_DIR
- WORKSPACE_DIR
- HOST
- PORT
- ANTHROPIC_BASE_URL
- ANTHROPIC_API_KEY
- CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC

Secrets must not be committed to Git.