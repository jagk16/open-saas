# Usar Node.js 20 como base
FROM node:20-alpine

# Instalar dependencias del sistema
RUN apk add --no-cache \
    git \
    python3 \
    make \
    g++ \
    postgresql-client \
    openssl

# Instalar Wasp CLI globalmente
RUN npm install -g @wasp/cli@latest

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración primero (para mejor caching)
COPY package*.json ./
COPY main.wasp ./
COPY schema.prisma ./
COPY nixpacks.toml ./

# Instalar dependencias
RUN npm ci --only=production

# Copiar código fuente
COPY . .

# Construir la aplicación
RUN wasp build

# Crear usuario no-root para seguridad
RUN addgroup -g 1001 -S nodejs
RUN adduser -S wasp -u 1001

# Cambiar ownership de archivos
RUN chown -R wasp:nodejs /app
USER wasp

# Exponer puerto
EXPOSE 3000

# Variables de entorno por defecto
ENV NODE_ENV=production
ENV PORT=3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/ || exit 1

# Comando de inicio
CMD ["wasp", "start"] 