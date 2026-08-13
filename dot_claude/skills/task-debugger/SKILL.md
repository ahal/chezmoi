---
name: task-debugger
description: Debug and fix Taskcluster task failures. Trigger on "debug task", a bare Taskcluster task ID, or a Taskcluster/Treeherder task URL/log link.
---

## Setup

**Taskcluster CLI:** Assume `taskcluster` is already installed and on PATH — do not verify this up front. Only if a command fails with a "not found"/"command not found" error, install it from https://github.com/taskcluster/taskcluster/releases/latest/ and retry.

```bash
export TASKCLUSTER_ROOT_URL=https://firefox-ci-tc.services.mozilla.com
```

**Commands:**
- `taskcluster task log <task-id>` - Get logs
- `taskcluster task def <task-id>` - Get definition (optional)

## Debug Process

1. Extract task ID from message or URL
2. Fetch logs: `taskcluster task log <task-id>`
3. Analyze errors (tracebacks, test failures, build errors)
4. If fix is obvious → apply it. Otherwise → reproduce locally:
   - Docker-worker tasks: `taskgraph load-task --develop <task-id>` (Firefox: `./mach taskgraph`, others: check virtualenv or `uv run taskgraph`)
   - Flags: `--interactive`, `--volume`, `--root`, `--image`, `--keep`
   - Non-docker: extract command from task def and run locally
5. For non-obvious issues: add debug statements → iterate → fix
6. Verify fix using same reproduction method
7. **Clean up** debug artifacts (don't re-verify after cleanup)
8. Report: root cause, fix, verification, files changed
