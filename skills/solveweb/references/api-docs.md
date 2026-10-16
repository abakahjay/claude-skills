# Live API docs for every route (Swagger UI that never goes stale)

Templates: `templates/backend/utils/apiDocs.js`, `templates/backend/utils/keepOriginalHandlers.js`,
`templates/backend/docs/apiAnnotations.js`, `templates/backend/scripts/captureApiExamples.js`.

## Why
Tools like `express-oas-generator` only document routes somebody has already called, so docs are always
incomplete. Instead build the OpenAPI spec from Express's own router at runtime.

## Wire it up (app.js)
```js
require('express-async-errors');
require('./utils/keepOriginalHandlers');   // before any router is created
...
const { getSpec } = require('./utils/apiDocs');
const apiDocsUi = { customSiteTitle: 'API docs', swaggerOptions: { url: '/api-docs.json', docExpansion: 'none', filter: true, persistAuthorization: true } };
app.get('/api-docs.json', (req, res) => res.json(getSpec(app)));
app.use('/api-docs', swaggerUi.serveFiles(null, apiDocsUi), swaggerUi.setup(null, apiDocsUi));
```
Mount other swagger pages (e.g. `/api-docs/portfolio`) BEFORE `/api-docs` with `serveFiles(spec)`.

## How it works
- Walks `app._router.stack`, rebuilding mount paths from Express 4 layer regexps; splits
  `router.route(p).get(a).post(b)` handlers by method.
- `express-async-errors` wraps every handler in an anonymous `newFn` and throws the original away;
  `keepOriginalHandlers.js` patches `Route.prototype[method]` and `Router.use` to keep it on
  `handler.original` (the `Layer.handle` property is non-configurable, so don't try redefining it).
- Login: recognises auth middleware by function name (`AUTH` list) and roles from `requireRole` guards.
- Fields: reads the controller source for `req.body/query/params` (destructuring, `req.body.x`,
  `const body = req.body ?? {}` aliases) and invents examples from field names.
- Tags from mount paths; `TAG_NAMES` maps cryptic mounts ("changedel") to readable names (display only).

## Examples
- Hand-written labels/examples: `docs/apiAnnotations.js`, key `"METHOD /full/path"` with `:params`.
  Verify response shapes against the controllers before writing them.
- Real examples: `captureApiExamples.js` walks the whole flow with temporary users and writes
  `docs/apiExamples.json`. It refuses to run unless `MONGO_URI` ends in `_docs_tmp` and drops that DB at
  the end - run it on an EMPTY throwaway database with email disabled, otherwise real users' names and
  phone numbers leak into public docs. Scan the output for emails/phones before committing.
- `npm run docs` = save `/api-docs.json` to `oas-docs/openapi.json` then widdershins -> `API.md`.
