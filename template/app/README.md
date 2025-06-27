# dtalent - Plataforma de Gestión de Talento

Plataforma completa para gestión de talento, reclutamiento y desarrollo profesional.

Built with [Wasp](https://wasp.sh), based on the [Open Saas](https://opensaas.sh) template.

## Características

- 🔐 Autenticación completa (Google, GitHub, Discord, Email)
- 💳 Integración con Stripe para pagos y suscripciones
- 📊 Dashboard administrativo con analytics
- 🤖 Integración con OpenAI para funcionalidades de IA
- 📁 Sistema de carga de archivos con AWS S3
- 📧 Sistema de emails automatizados
- 📈 Analytics con Plausible o Google Analytics

## Desarrollo

### Running locally
 - Make sure you have the `.env.client` and `.env.server` files with correct dev values in the root of the project.
 - Run the database with `wasp start db` and leave it running.
 - Run `wasp start` and leave it running.
 - [OPTIONAL]: If this is the first time starting the app, or you've just made changes to your entities/prisma schema, also run `wasp db migrate-dev`.

## Despliegue

Para desplegar en producción, sigue la guía de despliegue de Wasp con Fly.io o tu proveedor preferido.

## Licencia

MIT License

