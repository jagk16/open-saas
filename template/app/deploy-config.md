# Configuración de Despliegue para dtalent

## Variables de Entorno Requeridas

### Variables Esenciales (Siempre necesarias)
```bash
DATABASE_URL=postgresql://postgres:sx4WJhHkFk6u8DLL7pOK1Rh9TzIvPCuJ@supabase-db:5432/postgres
ADMIN_EMAILS=tu-email@dominio.com
```

### Variables Opcionales (Agregar cuando las necesites)
```bash
# Stripe (para pagos)
STRIPE_API_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
PAYMENTS_HOBBY_SUBSCRIPTION_PLAN_ID=price_...
PAYMENTS_PRO_SUBSCRIPTION_PLAN_ID=price_...
PAYMENTS_CREDITS_10_PLAN_ID=price_...

# Email (SendGrid)
SENDGRID_API_KEY=SG...

# OpenAI
OPENAI_API_KEY=sk-...

# Analytics
PLAUSIBLE_API_KEY=...
PLAUSIBLE_SITE_ID=...
PLAUSIBLE_BASE_URL=https://plausible.io

# AWS S3 (para archivos)
AWS_S3_REGION=us-east-1
AWS_S3_IAM_ACCESS_KEY=...
AWS_S3_IAM_SECRET_KEY=...

# OAuth providers
GOOGLE_CLIENT_ID=...
GOOGLE_CLIENT_SECRET=...
GITHUB_CLIENT_ID=...
GITHUB_CLIENT_SECRET=...
DISCORD_CLIENT_ID=...
DISCORD_CLIENT_SECRET=...
```

## Configuración por Proveedor

### Coolify
- **Build Method**: Dockerfile
- **Port**: 3000
- **Build Command**: (automático con Dockerfile)
- **Start Command**: (automático con Dockerfile)

### Railway
- **Build Method**: Dockerfile
- **Port**: 3000
- **Variables**: Configurar en Railway Dashboard

### Render
- **Build Method**: Dockerfile
- **Port**: 3000
- **Variables**: Configurar en Render Dashboard

### DigitalOcean App Platform
- **Build Method**: Dockerfile
- **Port**: 3000
- **Variables**: Configurar en DO Dashboard

### Heroku
- **Build Method**: Dockerfile
- **Port**: $PORT (Heroku asigna automáticamente)
- **Variables**: Configurar con `heroku config:set`

### AWS ECS/Fargate
- **Build Method**: Dockerfile
- **Port**: 3000
- **Variables**: Configurar en Task Definition

## Comandos de Despliegue

### Desarrollo Local
```bash
# Con Docker Compose
docker-compose up --build

# Con Wasp directamente
wasp start
```

### Producción
```bash
# Build de imagen
docker build -t dtalent-app .

# Ejecutar contenedor
docker run -p 3000:3000 \
  -e DATABASE_URL="tu_url" \
  -e ADMIN_EMAILS="tu-email" \
  dtalent-app
```

## Verificación de Despliegue

1. **Health Check**: `http://tu-dominio.com/`
2. **Base de datos**: Verificar conexión en logs
3. **Variables**: Verificar que todas las variables estén configuradas 