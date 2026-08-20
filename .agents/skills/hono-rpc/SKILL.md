---
name: hono-rpc
description: >
  Hono validation and RPC type-sharing. Triggers on Valibot validation, RPC mode,
  hc client, type-safe APIs, appType export, or hono/valibot-validator.
---

# Hono Validation & RPC

## Validation

Basic validator from `hono/validator`:
```ts
import { validator } from 'hono/validator'

app.post('/posts',
  validator('form', (value, c) => {
    const body = value['body']
    if (!body || typeof body !== 'string') {
      return c.text('Invalid!', 400)
    }
    return { body }
  }),
  (c) => {
    const { body } = c.req.valid('form')
    return c.json({ message: 'Created!' }, 201)
  }
)
```

Targets: `form`, `json`, `query`, `header`, `cookie`, `param`.

Headers: use **lowercase** keys (`idempotency-key` not `Idempotency-Key`).
JSON/form: must have matching `content-type` header.

## Valibot Integration

```ts
import { vValidator } from '@hono/valibot-validator'
import * as v from 'valibot'

app.get('/hello',
  vValidator('query', v.object({ name: v.string() })),
  (c) => {
    const { name } = c.req.valid('query')
    return c.json({ message: `Hello! ${name}` })
  }
)
```

## RPC Type Sharing

Write endpoint, export type:
```ts
import { Hono } from 'hono'
import { vValidator } from '@hono/valibot-validator'
import * as v from 'valibot'

const route = new Hono()
  .post('/todo',
    vValidator('form', v.object({
      id: v.string(),
      title: v.string(),
    })),
    (c) => {
      const todo = c.req.valid('form')
      return c.json({ message: 'created!' })
    }
  )
  .get((c) => c.json({ todos: [] }))

export type AppType = typeof route
```

Client with `hc`:
```ts
import { hc } from 'hono/client'
import type { AppType } from './server'

const client = hc<AppType>('/api')

// Type-safe request
const res = await client.todo.$post({
  form: { id: '1', title: 'Write code' }
})
const data = await res.json()

// Query params
const res2 = await client.hello.$get({
  query: { name: 'Hono' }
})
```

With React Query:
```tsx
import { useQuery, useMutation } from '@tanstack/react-query'
import { InferResponseType, InferRequestType } from 'hono/client'

const $post = client.todo.$post
const mutation = useMutation<
  InferResponseType<typeof $post>,
  Error,
  InferRequestType<typeof $post>['form']
>({
  mutationFn: async (todo) => {
    const res = await client.todo.$post({ form: todo })
    return await res.json()
  },
})
```

## Best Practices

- Chain methods for correct type inference: `app.get().post()` not separate `app.get()` + `app.post()`
- Export `typeof route` (chained variable), not `typeof app`
- All routes must be chained for RPC to infer correctly
