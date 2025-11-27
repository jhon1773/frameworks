# -----------------------------
# Stage 1: Builder
# -----------------------------
FROM oven/bun:latest AS builder
WORKDIR /app

# Copiar manifiestos para cache eficiente
COPY package.json bun.lock ./

# Instalar dependencias basado en lockfile
RUN bun install --frozen-lockfile

# Copiar el resto del proyecto
COPY . .

# Crear build si existe (TS → JS, bundling, etc)
RUN bun run build --if-present


# -----------------------------
# Stage 2: Runtime
# -----------------------------
FROM oven/bun:latest
WORKDIR /app

# Copiar resultados del build
COPY --from=builder /app ./

ENV NODE_ENV=production
EXPOSE 3000

# Ejecutar start → test → fallback
# NOTE: CMD fixed to a single-line JSON-array to avoid Dockerfile parse errors
CMD ["sh", "-c", "bun run start 2>/dev/null || bun test 2>/dev/null || node index.js 2>/dev/null || tail -f /dev/null"]
