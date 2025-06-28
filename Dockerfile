# Usar Node.js 20 como base
FROM node:20-alpine

# Instalar dependencias del sistema necesarias para Wasp CLI
RUN apk add --no-cache \
    git \
    python3 \
    make \
    g++ \
    postgresql-client \
    openssl \
    curl \
    bash \
    tar \
    xz

# Instalar Wasp CLI usando bash y crear symlink global
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | bash \
    && ln -s /root/.local/bin/wasp /usr/local/bin/wasp \
    && wasp --version

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración primero (para mejor caching)
COPY template/app/package*.json ./
COPY template/app/main.wasp ./
COPY template/app/schema.prisma ./
COPY template/app/nixpacks.toml ./

# Instalar dependencias
RUN npm ci --only=production

# Copiar código fuente
COPY template/app/ .

# Construir la aplicación (como root, para que Wasp encuentre su binario)
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