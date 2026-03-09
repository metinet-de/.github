---
layout: post
title: "Shadow Code: The AI Output Nobody Reviews"
date: 2026-03-09
lang: en
ref: shadow-code-ai-output
tags: [ai, software-engineering, code-quality, security]
---

You are shipping features faster than ever. You also have no idea what half of them actually do.

That is the shadow code problem. And it is not a theoretical risk — it is already happening in your codebase.

## The Code Delirium

AI coding assistants are genuinely useful. A well-prompted model can produce working, structured code in seconds. For many engineers, this feels like a superpower. It also creates a trap.

The trap has a name: **code delirium**. Feature after feature, sprint after sprint, the velocity feels irresistible. You finish one prompt and immediately start the next. The model outputs. You review — briefly, because the output looks reasonable. You commit.

Repeat.

The compounding effect is invisible until it is not. At some point, you realize you have a production system that nobody fully understands anymore.

## What Shadow Code Is

**Shadow code** is not just technical debt. Technical debt is code you chose to write imperfectly. Shadow code is code that nobody consciously chose at all.

It lives in the gaps between your prompts. It is the helper function the model added "for completeness." The abstraction layer that handles five edge cases your application will never hit. The error-handling pattern that conflicts with the pattern two modules over — because the model did not know about it.

Nobody reviewed it. Not really. You scanned it. You ran the tests. You shipped it.

## Why This Is Dangerous

The problems are not abstract.

**Unnecessary code.** Models generate complete solutions. Complete means generalized. Generalized means bloated for your specific context. Your application gets heavier, slower, and harder to reason about with every AI-generated feature.

**Security vulnerabilities.** Unreviewed authentication logic, database queries, and API endpoints are an attack surface. The [OWASP Top 10](https://owasp.org/www-project-top-10/) vulnerabilities — SQL injection, broken access control, insecure deserialization — do not care how fast you shipped. They slip in quietly, especially when nobody reads the full diff.

**Architectural estrangement.** This is the most underrated consequence. The longer you let the model make architectural decisions unchallenged, the more distant you become from your own system. Solution paths are accepted, not understood. The mental model of your codebase fades. You become a prompt engineer managing a codebase you no longer own.

## Frameworks Help, But Not Enough

There is genuine protection in using well-established frameworks. Models trained on large public codebases have seen Rails, Django, Spring, and NestJS thousands of times. When you work within a known framework and give the model that structure, it tends to follow established patterns — including the best practices baked into that ecosystem.

This is real, and it is not nothing.

But it does not solve the fundamental problem. Frameworks provide structural guardrails. They do not prevent unnecessary abstractions. They do not catch the subtle security issue in the authentication flow. They do not stop you from losing ownership of your own software.

## What to Do About It

The answer is not to stop using AI assistants. That is not realistic, and it would not be the right call even if it were.

The answer is to engineer the review process back in — deliberately, structurally.

**Instruction files.** GitHub Copilot supports `.github/copilot-instructions.md`. Use it. Specify which patterns are allowed, which are forbidden, how errors should be handled, which layers the model is permitted to touch. Other tools, including Claude Projects, support equivalent system-level instructions. Write them. Be specific.

**Automated pre-commit security checks.** Create a sub-agent or pre-commit hook that runs an OWASP Top 10 check before every commit. This does not have to be manual. Another model can do it. The key is that it is mandatory and happens every time — not when you remember to do it.

**Review your guardrails, too.** Here is where most teams fail. The instruction files and sub-agent prompts are often themselves AI-generated. That is fine. But they are also code — they can drift, become outdated, or never actually reflect what you intended. Review them on a schedule. Treat them like any other critical configuration.

## The Ownership Question

Speed without ownership is not productivity. It is delegation without accountability.

The model does not own your codebase. You do. Every line that ships is yours — regardless of who generated it. That is not a moral position; it is a practical one. When the production incident happens at 2am, the model will not be on call.

Read the diff.

Understand what you are shipping.

Set the guardrails, then audit the guardrails.

Standing still is not an option. But shipping code you do not understand is not progress. It is a different kind of standing still.
