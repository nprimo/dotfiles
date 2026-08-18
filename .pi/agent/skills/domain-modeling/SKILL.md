---
name: domain-modeling
description: Build and sharpen a project's domain model. Use when the user wants to pin down domain terminology or a ubiquitous language, record an architectural decision, or when another skill needs to maintain the domain model.
---

# Domain Modeling

Actively build and sharpen the project's domain model as you design. This is the _active_ discipline — challenge terms, invent edge-case scenarios, and write the glossary and decisions down when they crystallise. Merely reading `CONTEXT.md` for vocabulary is not this skill; that is a one-line habit any skill can do. This skill is for changing the model.

## File structure

Most repos have a single context:

```
/
├── CONTEXT.md
├── docs/
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

If a `CONTEXT-MAP.md` exists at the root, the repo has multiple contexts. The map points to where each one lives:

```
/
├── CONTEXT-MAP.md
├── docs/adr/                          ← system-wide decisions
├── src/
│   ├── ordering/
│   │   ├── CONTEXT.md
│   │   └── docs/adr/                 ← context-specific decisions
│   └── billing/
│       ├── CONTEXT.md
│       └── docs/adr/
```

Create files lazily — only when there is something to write. If no `CONTEXT.md` exists, create one when the first term is resolved. If no `docs/adr/` exists, create it when the first ADR is needed.

## During the session

### Challenge against the glossary

When the user uses a term that conflicts with existing language in `CONTEXT.md`, call it out immediately. “Your glossary defines ‘cancellation’ as X, but you seem to mean Y — which is it?”

### Sharpen fuzzy language

When the user uses vague or overloaded terms, propose a precise canonical term. “You’re saying ‘account’ — do you mean Customer or User? Those are different things.”

### Discuss concrete scenarios

When discussing domain relationships, stress-test them with specific scenarios. Invent scenarios that probe edge cases and force precision about boundaries between concepts.

### Cross-reference with code

When the user states how something works, check whether the code agrees. If there is a contradiction, surface it: “Your code cancels entire Orders, but you just said partial cancellation is possible — which is right?”

### Update CONTEXT.md inline

When a term is resolved, update `CONTEXT.md` immediately. Do not batch updates. Use [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md).

`CONTEXT.md` must contain no implementation details. It is a glossary, not a spec, scratch pad, or repository for implementation decisions.

### Offer ADRs sparingly

Offer an ADR only when all three are true:

1. **Hard to reverse** — changing the decision later has meaningful cost.
2. **Surprising without context** — a future reader would wonder why it was done this way.
3. **A real trade-off** — genuine alternatives existed and one was selected for specific reasons.

If any condition is missing, skip the ADR. Use [ADR-FORMAT.md](./ADR-FORMAT.md).
