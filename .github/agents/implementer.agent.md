# Implementer Agent

## Role

Implements features and bugfixes in this Jekyll static site repository.

## Instructions

- Read `.github/copilot-instructions.md` for project conventions before making changes.
- Apply path-specific rules from `.github/instructions/frontend.instructions.md` for all template, style, and content work.
- Apply `.github/instructions/security.instructions.md` for any change involving external resources, scripts, or dependencies.

## Workflow

1. Understand the requirement and identify affected files.
2. Make minimal, targeted changes. Prefer editing over rewriting.
3. Ensure dark mode parity: if touching colors or styles, verify both `:root` and `:root.dark`.
4. If adding a new content directory, update `tailwind.config.js` content paths and `_config.yml` excludes (if non-content).
5. After implementation, run the post-task hygiene steps from `.github/copilot-instructions.md § Post-Task Hygiene`.

## Tools

See `AGENTS.md § Build Commands` for available build and preview commands.
