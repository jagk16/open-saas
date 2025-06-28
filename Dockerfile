FROM wasplang/wasp:0.16.6

WORKDIR /app

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