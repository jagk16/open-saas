# dtalent - Plataforma de Gestión de Talento

Plataforma completa para gestión de talento, reclutamiento y desarrollo profesional.

Built with [Wasp](https://wasp.sh), based on the [Open Saas](https://opensaas.sh) template.

## 🚀 Despliegue Rápido

### Variables de Entorno Requeridas

```bash
# Variables ESENCIALES (siempre necesarias)
DATABASE_URL=postgresql://postgres:sx4WJhHkFk6u8DLL7pOK1Rh9TzIvPCuJ@supabase-db:5432/postgres
ADMIN_EMAILS=tu-email@dominio.com

# Variables OPCIONALES (agregar cuando las necesites)
# STRIPE_API_KEY=sk_test_...
# STRIPE_WEBHOOK_SECRET=whsec_...
# SENDGRID_API_KEY=SG...
# OPENAI_API_KEY=sk-...
# PLAUSIBLE_API_KEY=...
# PLAUSIBLE_SITE_ID=...
# PLAUSIBLE_BASE_URL=https://plausible.io
# PAYMENTS_HOBBY_SUBSCRIPTION_PLAN_ID=price_...
# PAYMENTS_PRO_SUBSCRIPTION_PLAN_ID=price_...
# PAYMENTS_CREDITS_10_PLAN_ID=price_...
```

### Configuración en Coolify

1. **Build Method**: `Dockerfile` o `Nixpacks`
2. **Port**: `3000`
3. **Variables de entorno**: Configurar las variables listadas arriba

### Configuración en Otros Proveedores

- **Railway**: Usar Dockerfile
- **Render**: Usar Dockerfile
- **DigitalOcean**: Usar Dockerfile
- **Heroku**: Usar Dockerfile

## 🛠️ Desarrollo Local

```bash
# Navegar al directorio de la aplicación
cd template/app

# Instalar dependencias
npm install

# Configurar variables de entorno
cp env.server.example .env.server
# Editar .env.server con tus valores

# Iniciar desarrollo
wasp start
```

## 📁 Estructura del Proyecto

```
├── template/app/          # Código principal de la aplicación
│   ├── src/              # Código fuente
│   ├── main.wasp         # Configuración de Wasp
│   ├── schema.prisma     # Esquema de base de datos
│   └── package.json      # Dependencias
├── Dockerfile            # Configuración para Docker
├── nixpacks.toml         # Configuración para Nixpacks
└── .dockerignore         # Archivos ignorados en Docker
```

## 🔧 Características

- 🔐 Autenticación completa (Google, GitHub, Discord, Email)
- 💳 Integración con Stripe para pagos y suscripciones
- 📊 Dashboard administrativo con analytics
- 🤖 Integración con OpenAI para funcionalidades de IA
- 📁 Sistema de carga de archivos con AWS S3
- 📧 Sistema de emails automatizados
- 📈 Analytics con Plausible o Google Analytics

## 📄 Licencia

MIT License

## Welcome to your new SaaS App! 🎉
<a href="https://www.producthunt.com/posts/open-saas?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-open&#0045;saas" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=436467&theme=light" alt="Open&#0032;SaaS - Open&#0045;source&#0032;&#0038;&#0032;100&#0037;&#0032;free&#0032;React&#0032;&#0038;&#0032;Node&#0046;js&#0032;SaaS&#0032;starter&#0033; | Product Hunt" style="width: 250px; height: 54px;" width="250" height="54" /></a>

https://github.com/wasp-lang/open-saas/assets/70215737/5ff289b1-12b9-4b46-aa90-a6a3122de93e

You've decided to build a SaaS app with the Open SaaS template. Great choice! 

This template is:

1. fully open-source
2. completely free to use and distribute
3. comes with a ton of features out of the box!
4. focused on free, open-source services, where possible

🧑‍💻 Check it out in action here: [OpenSaaS.sh](https://opensaas.sh)  
📚 Check out the Docs here: [Open SaaS Docs](https://docs.opensaas.sh)

## What's inside?

The template itself is built on top of some very powerful tools and frameworks, including:

- 🐝 [Wasp](https://wasp.sh) - a full-stack React, NodeJS, Prisma framework with superpowers
- 🚀 [Astro](https://starlight.astro.build/) - Astro's lightweight "Starlight" template for documentation and blog
- 💸 [Stripe](https://stripe.com) or [Lemon Squeezy](https://lemonsqueezy.com/) - for products and payments
- 📈 [Plausible](https://plausible.io) or [Google](https://analytics.google.com/) Analytics
- 🤖 [OpenAI](https://openai.com) - OpenAI API w/ function calling example
- 📦 [AWS S3](https://aws.amazon.com/s3/) - for file uploads
- 📧 [SendGrid](https://sendgrid.com), [MailGun](https://mailgun.com), or SMTP - for email sending
- 💅 [TailwindCSS](https://tailwindcss.com) - for styling
- 🧑‍💼 [TailAdmin](https://tailadmin.com/) - admin dashboard & components for TailwindCSS
- 🧪 [Playwright](https://playwright.dev) - end-to-end tests with Playwright

Because we're using Wasp as the full-stack framework, we can leverage a lot of its features to build our SaaS in record time, including:

- 🔐 [Full-stack Authentication](https://wasp.sh/docs/auth/overview) - Email verified + social Auth in a few lines of code.
- ⛑ [End-to-end Type Safety](https://wasp.sh/docs/data-model/operations/overview) - Type your backend functions and get inferred types on the front-end automatically, without the need to install or configure any third-party libraries. Oh, and type-safe Links, too!
- 🤖 [Jobs](https://wasp.sh/docs/advanced/jobs) - Run cron jobs in the background or set up queues simply by defining a function in the config file.
- 🚀 [One-command Deploy](https://wasp.sh/docs/advanced/deployment/overview) - Easily deploy via the CLI to [Fly.io](https://fly.io), or to other providers like [Railway](https://railway.app) and [Netlify](https://netlify.com).

You also get access to Wasp's diverse, helpful community if you get stuck or need help.
- 🤝 [Wasp Discord](https://discord.gg/aCamt5wCpS)

## Getting Started

### Simple Instructions

First, to install the latest version of [Wasp](https://wasp.sh/) on macOS, Linux, or Windows with WSL, run the following command:
```bash
curl -sSL https://get.wasp.sh/installer.sh | sh
```

Then, create a new SaaS app with the following command:

```bash
wasp new -t saas
```

This will create a **clean copy of the Open SaaS template** into a new directory, and you can start building your SaaS app right away!

### Detailed Instructions

For everything you need to know about getting started and using this template, check out the [Open SaaS Docs](https://docs.opensaas.sh).

We've documented everything in great detail, including installation instructions, pulling updates to the template, guides for integrating services, SEO, deployment, and more. 🚀

## Getting Help & Providing Feedback

There are two ways to get help or provide feedback (and we try to always respond quickly!):
1. [Open an issue](https://github.com/wasp-lang/open-saas/issues)
2. [Wasp Discord](https://discord.gg/aCamt5wCpS) -- please direct questions to the #🙋questions forum channel

## Contributing

Note that we've tried to get as many of the core features of a SaaS app into this template as possible, but there still might be some missing features or functionality.

We could always use some help tying up loose ends: contributions are welcome! Check out [CONTRIBUTING.md](/CONTRIBUTING.md) for more details.

