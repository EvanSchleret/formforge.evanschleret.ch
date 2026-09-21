# FormForge Wiki

Official documentation for [FormForge](https://github.com/EvanSchleret/FormForge), a deterministic dynamic forms engine for Laravel, and [FormForge Client](https://github.com/EvanSchleret/FormForgeClient), its typed Nuxt 4 client.

The site provides practical guides and reference documentation for building, exposing, rendering, and managing forms with a shared schema.

Visit the published wiki at [formforge.evanschleret.ch](https://formforge.evanschleret.ch/).

## What the wiki covers

- FormForge backend installation and code-first form definitions.
- Immutable revisions, publication windows, conditions, validation, and categories.
- Secure Laravel HTTP APIs with scoped routes, ownership, abilities, and middleware.
- Submission uploads, drafts, idempotency, automations, exports, and GDPR retention.
- FormForge Client installation, Nuxt module configuration, composables, and typed runtime APIs.
- Renderer, builder, preview, controlled, standalone, and admin integration modes.
- MCP tools and prompts for connecting the documentation to AI assistants.
- Open-source roadmap, releases, contributing, and security information.

## Documentation map

- [Getting started](https://formforge.evanschleret.ch/docs/getting-started)
- [Concepts](https://formforge.evanschleret.ch/docs/concepts)
- [Backend documentation](https://formforge.evanschleret.ch/docs/backend/overview)
- [Client documentation](https://formforge.evanschleret.ch/docs/client/overview)
- [How do I...?](https://formforge.evanschleret.ch/docs/how-do-i)
- [MCP and AI](https://formforge.evanschleret.ch/docs/mcp-ai)
- [Open source](https://formforge.evanschleret.ch/docs/open-source)

## MCP endpoint

The wiki exposes an MCP server at [`https://formforge.evanschleret.ch/mcp`](https://formforge.evanschleret.ch/mcp). MCP-compatible clients can use it to discover documentation pages, read their Markdown source, and suggest an integration mode.

See the [MCP connection guide](https://formforge.evanschleret.ch/docs/mcp-ai/connect-your-client) for client configuration examples.

## Local development

This repository contains a Nuxt 4 application powered by Nuxt UI, Nuxt Content, and the Nuxt MCP Toolkit.

### Requirements

- [Bun](https://bun.sh/) `>=1.3`
- A GitHub token if the local site should display GitHub release or star data

### Setup

```bash
cp .env.example .env
bun install
```

Set `SITE_URL` in `.env` when generating absolute URLs. Set `GITHUB_TOKEN` to enable authenticated GitHub API requests for the dashboard data.

### Development server

```bash
bun run dev
```

### Quality checks

```bash
bun run lint
bun run typecheck
```

### Production preview

```bash
bun run build
bun run preview
```

The repository also includes a `Dockerfile` for building and running the Nuxt application with Bun.

## Related repositories

- [FormForge backend](https://github.com/EvanSchleret/FormForge)
- [FormForge Client](https://github.com/EvanSchleret/FormForgeClient)
- [FormForge Wiki](https://github.com/EvanSchleret/formforge.evanschleret.ch)

## License

This documentation site is available under the [MIT License](LICENSE).
