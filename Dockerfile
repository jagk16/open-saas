FROM node:20-alpine

WORKDIR /app

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

# Instalar Wasp CLI usando la URL oficial
RUN curl -sSL https://get.wasp.sh/installer.sh | bash \
    && ln -s /root/.local/bin/wasp /usr/local/bin/wasp

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias de Node.js
RUN npm install

# Variables de entorno por defecto (se pueden sobrescribir)
ENV NODE_ENV=production
ENV DATABASE_URL=postgresql://user:pass@host:5432/db
ENV ADMIN_EMAILS=admin@tuapp.com

# Ejecutar migraciones y build
RUN wasp db migrate-dev --force
RUN wasp build

# Exponer puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["wasp", "start"] 