# Explain Change

## Purpose

Generate a clear, concise explanation of a code change for commit messages, PR descriptions, or documentation.

## Steps

1. Identify all files modified, added, or deleted.
2. For each file, summarize what changed and why.
3. Note any side effects: build config updates, style changes, new dependencies.
4. Flag any breaking changes (permalink changes, removed pages, API contract changes).

## Output Format

```
## Summary
[one-sentence description]

## Changes
- [file]: [what changed and why]

## Side Effects
- [any build, config, or dependency changes]

## Breaking Changes
- [list or "None"]
```
