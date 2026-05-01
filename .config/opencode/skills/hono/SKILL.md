---
name: hono
description: >
  Hono web framework reference. Triggers on Hono code, routing, Context, middleware,
  validation, RPC, presets, or deployment to Cloudflare/Deno/Bun/Node.js.
  Covers core API, routing, Context, HonoRequest, presets, validation, RPC, helpers.
---

# Hono Reference

Hono - flame🔥 in Japanese - small, simple, ultrafast web framework on Web Standards. Runs on Cloudflare Workers, Deno, Bun, Node.js, AWS Lambda, etc.

## Quick Start
```ts
import { Hono } from 'hono'
const app = new Hono()
app.get('/', (c) => c.text('Hono!'))
export default app
```
Create project: `npm create hono@latest` (npm/yarn/pnpm/bun/deno).

## Features
- Ultrafast: RegExpRouter (fastest JS router)
- Lightweight: `hono/tiny` under 14kB
- Multi-runtime: works on all JS runtimes
- Batteries included: built-in middleware/helpers
- TypeScript first: full type support, RPC mode

## Use-cases
Web APIs, backend proxies, CDN edge apps, full-stack apps.

## Core API

### Hono Object
Primary object. Methods:
- `app.HTTP_METHOD(path, handler/middleware)` (get/post/put/delete/etc.)
- `app.all(path, handler)` - all methods
- `app.on(method[], path[], handler)`
- `app.use(path?, middleware)` - register middleware
- `app.route(path, subApp)` - group routes
- `app.basePath(path)` - set base path
- `app.notFound(handler)` - custom 404
- `app.onError((err, c) => {})` - error handling
- `app.fetch(request, env, ctx)` - entry point
- `app.request(path/Request)` - testing

Presets:
- `hono`: default, SmartRouter (RegExp + Trie)
- `hono/quick`: LinearRouter for per-request init
- `hono/tiny`: PatternRouter, smallest size

### Routing
- Path params: `/user/:name` → `c.req.param('name')`
- Optional params: `/api/animal/:type?`
- Regex params: `/post/:date{[0-9]+}/:title{[a-z]+}`
- Grouping: `app.route('/book', bookApp)`
- Chained routes: `app.get('/endpoint', ...).post(...).delete(...)`

Priority: registration order. Handlers stop execution.

### Context (c)
Per-request object:
- `c.req`: HonoRequest instance
- `c.status(code)`: set HTTP status (default 200)
- `c.header(key, value)`: set response header
- `c.text(body)`: return text/plain
- `c.json(body)`: return application/json
- `c.html(body)`: return text/html
- `c.redirect(path, status=302)`
- `c.notFound()`: return 404
- `c.set(key, value)` / `c.get(key)`: request-scoped variables
- `c.env`: Cloudflare Workers bindings
- `c.executionCtx`: Cloudflare ExecutionContext

### HonoRequest (c.req)
- `c.req.param(key?)`: path params
- `c.req.query(key?)`: query params
- `c.req.queries(key)`: multiple query values
- `c.req.header(key?)`: request headers
- `c.req.json()`: parse JSON body
- `c.req.text()`: parse text body
- `c.req.parseBody()`: parse form/multipart
- `c.req.valid(target)`: validated data (target: form/json/query/header/cookie/param)

## Validation & RPC
See `hono-rpc` skill for validation (Zod) and RPC type sharing.

## Middleware & Helpers
Built-in:
- Auth: basic-auth, bearer-auth, jwt
- Security: cors, csrf, secure-headers, ip-restriction
- Utility: etag, logger, compress, cache, body-limit, timeout
- Helpers: cookie, html, jsx, proxy, websocket, streaming, ssg

Full docs: https://hono.dev/llms-full.txt
Tiny docs: https://hono.dev/llms-small.txt
