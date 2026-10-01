#!/bin/bash

set -e

echo "=========================================="
echo " Claude Code + CloudCLI"
echo "=========================================="

echo "Claude Code:"
claude --version || true

echo "CloudCLI:"
cloudcli --version || true

echo "=========================================="
echo " Environment"
echo "=========================================="

echo "Workspace: ${WORKSPACE_DIR}"
echo "Claude Config: ${CLAUDE_CONFIG_DIR}"
echo "CloudCLI Port: ${PORT}"

if [ -n "${ANTHROPIC_BASE_URL:-}" ]; then
    echo "Anthropic Gateway: ${ANTHROPIC_BASE_URL}"
else
    echo "WARNING: ANTHROPIC_BASE_URL is not configured"
fi

if [ -n "${ANTHROPIC_API_KEY:-}" ]; then
    echo "Anthropic API Key: configured"
else
    echo "WARNING: ANTHROPIC_API_KEY is not configured"
fi

echo "=========================================="
echo " Starting CloudCLI"
echo "=========================================="

exec cloudcli