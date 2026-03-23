#!/usr/bin/env bash
set -euo pipefail

# Fetch the latest failed build log from GitHub Actions and invoke Claude Code
# Usage: ./fix-build.sh [branch-name]

BRANCH="${1:-$(git branch --show-current)}"
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)

echo "Looking for failed runs on branch: $BRANCH"

# Get the latest failed run ID
RUN_ID=$(gh run list --branch "$BRANCH" --status failure --limit 1 --json databaseId -q '.[0].databaseId')

if [ -z "$RUN_ID" ]; then
  echo "No failed runs found on branch $BRANCH"
  exit 1
fi

echo "Found failed run: $RUN_ID"
echo "Downloading build log artifact..."

# Download the build log artifact
rm -rf /tmp/build-log
gh run download "$RUN_ID" --name build-log --dir /tmp/build-log

BUILD_LOG=$(cat /tmp/build-log/build.log)

echo ""
echo "=== Build Log ==="
echo "$BUILD_LOG"
echo "================="
echo ""
echo "Launching Claude Code to analyze and fix..."
echo ""

# Launch Claude interactively with the build log as context
claude "The CI build failed. Here is the build log:

$BUILD_LOG

Analyze the errors and fix the code so it compiles. Only change what is necessary."
