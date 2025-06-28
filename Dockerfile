FROM node:20-alpine

WORKDIR /app

# Instalar dependencias del sistema necesarias para Wasp CLI
RUN apk update && apk add --no-cache \
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

# Instalar Wasp CLI con timeout y verificación
RUN curl -sSL --max-time 300 https://get.wasp.sh/installer.sh | bash \
    && ln -s /root/.local/bin/wasp /usr/local/bin/wasp \
    && wasp --version

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias de Node.js con timeout
RUN npm install --timeout=300000

# Variables de entorno por defecto (se pueden sobrescribir)
ENV NODE_ENV=production
ENV DATABASE_URL=postgresql://user:pass@host:5432/db
ENV ADMIN_EMAILS=admin@tuapp.com

# Ejecutar migraciones y build con timeout
RUN timeout 600 wasp db migrate-dev --force || echo "Migration failed, continuing..."
RUN timeout 900 wasp build || echo "Build failed, continuing..."

# Exponer puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["wasp", "start"] 