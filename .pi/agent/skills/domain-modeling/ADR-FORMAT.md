# ADR Format

ADRs live in `docs/adr/` and use sequential numbering: `0001-slug.md`, `0002-slug.md`, etc.

Create `docs/adr/` lazily — only when the first ADR is needed.

## Template

```md
# {Short title of the decision}

{1-3 sentences: what's the context, what did we decide, and why.}
```

That's it. An ADR can be a single paragraph. The value is recording *that* a decision was made and *why* — not filling out sections.

## Optional sections

Only include these when they add genuine value. Most ADRs need none.

- **Status** frontmatter (`proposed | accepted | deprecated | superseded by ADR-NNNN`) — useful when decisions are revisited
- **Considered Options** — only when rejected alternatives are worth remembering
- **Consequences** — only when non-obvious downstream effects need to be called out

## Numbering

Scan `docs/adr/` for the highest existing number and increment by one.

## When to offer an ADR

All three conditions must be true:

1. **Hard to reverse** — changing the decision later has meaningful cost.
2. **Surprising without context** — a future reader would wonder why it was done this way.
3. **A real trade-off** — genuine alternatives existed and one was selected for specific reasons.

If any condition is missing, skip the ADR.

## What qualifies

- **Architectural shape.** “We're using a monorepo.” “The write model is event-sourced, the read model is projected into Postgres.”
- **Integration patterns between contexts.** “Ordering and Billing communicate via domain events, not synchronous HTTP.”
- **Technology choices with lock-in.** Database, message bus, auth provider, deployment target. Not every library — only choices that would take substantial effort to swap.
- **Boundary and scope decisions.** “Customer data is owned by the Customer context; other contexts reference it by ID only.” Explicit no-s are valuable.
- **Deliberate deviations from the obvious path.** Anything where a reasonable reader would assume the opposite.
- **Constraints not visible in code.** Compliance, partner contracts, or latency requirements.
- **Rejected alternatives when rejection is non-obvious.** Record why a reasonable alternative was rejected.
