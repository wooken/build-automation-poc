# Build Automation POC

Demonstrates using Claude Code locally to fix C build failures detected in GitHub Actions CI.

## How it works

1. Push to a `demo-*` branch triggers a GitHub Actions build
2. If the build fails, the build log is uploaded as an artifact
3. You run `./fix-build.sh` locally — it fetches the log and opens Claude Code interactively
4. Review Claude's proposed fix, then push to re-trigger the build

## Setup

1. Push the repo to GitHub
2. Install the [GitHub CLI](https://cli.github.com/) (`gh`) and authenticate

## Running a demo

Tag the broken state once (first time only):
```bash
git tag demo-broken
```

For each demo run:
```bash
git checkout demo-broken -b demo-run-1
git push origin demo-run-1
# Wait for CI to fail...
./fix-build.sh
# Review Claude's fix, then push
git push origin demo-run-1
```

For subsequent demos, increment the branch name (`demo-run-2`, `demo-run-3`, etc.).

## The intentional bug

`src/strutil.c` is missing `#include <string.h>` and `#include <stddef.h>`, causing
the build to fail with `-Wall -Werror`.
