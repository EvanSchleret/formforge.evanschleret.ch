FROM oven/bun:1.4-alpine AS build-base

WORKDIR /app
RUN apk add --no-cache g++ make python3 git curl

# Install
FROM build-base AS install

RUN mkdir -p /temp

COPY --link package.json bun.lock /temp/
RUN cd /temp && bun install

# Build
FROM install AS prerelease

COPY --from=install /temp/node_modules node_modules
COPY . .

RUN bun run build

# Production
FROM oven/bun:1.4-alpine AS release
WORKDIR /app

COPY --chown=bun:bun --from=install /temp/node_modules node_modules
COPY --chown=bun:bun --from=prerelease /app/.output /app/.output/

USER bun

ENV NODE_ENV=production

EXPOSE 3000

CMD [ "bun", "run", ".output/server/index.mjs" ]
