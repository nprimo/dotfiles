---
name: grill-with-docs
description: Start a relentless plan or design interview while recording resolved domain language and architectural decisions. Invoke explicitly with /skill:grill-with-docs.
disable-model-invocation: true
---

Run a grilling session using the `grilling` skill workflow and apply the `domain-modeling` workflow while doing so.

- Interview the user relentlessly about every aspect of the plan.
- Walk each branch of the design tree and resolve dependent decisions one at a time.
- Ask one question per turn, waiting for the answer before continuing.
- Provide your recommended answer with every question.
- Explore the codebase when it can answer a question instead of asking the user.
- Challenge vague, overloaded, or glossary-conflicting terms immediately.
- Use concrete scenarios to test domain boundaries and edge cases.
- Update `CONTEXT.md` inline when a term is resolved.
- Offer an ADR only when the decision is hard to reverse, surprising without context, and the result of a real trade-off.

Use the `domain-modeling` skill's `CONTEXT-FORMAT.md` and `ADR-FORMAT.md` files for documentation format.
