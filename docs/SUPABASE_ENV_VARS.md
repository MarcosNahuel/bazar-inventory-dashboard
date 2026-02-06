# Variables de Entorno - Supabase Cloud

**Generado:** 2026-02-05
**Proyecto:** Dashboard HUANGCOM (compartido con BAZAR)

---

## Credenciales Supabase Cloud (USAR ESTAS)

| Variable | Valor |
|----------|-------|
| **URL** | `https://ahqaiqxdauzniiswrhcs.supabase.co` |
| **ANON_KEY** | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFocWFpcXhkYXV6bmlpc3dyaGNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg1NTk2MDAsImV4cCI6MjA4NDEzNTYwMH0.-J1PFGRGBfnYUjnXN1e7Vz2wbe4ARxRUJ1y-smNTPI0` |

---

## Variables de Entorno para Vercel (BAZAR App)

```env
NEXT_PUBLIC_SUPABASE_URL=https://ahqaiqxdauzniiswrhcs.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFocWFpcXhkYXV6bmlpc3dyaGNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg1NTk2MDAsImV4cCI6MjA4NDEzNTYwMH0.-J1PFGRGBfnYUjnXN1e7Vz2wbe4ARxRUJ1y-smNTPI0
```

> **NOTA:** El SERVICE_ROLE_KEY debe obtenerse desde el dashboard de Supabase > Settings > API

---

## (BACKUP) Variables Supabase Self-Hosted (VPS con problemas IPv6)

### Dashboard Studio (Kong)
| Campo | Valor |
|-------|-------|
| **Usuario** | `admin` |
| **Password** | `tW41lJCCVkB4nMK98_UCMQ` |

### Variables de Entorno Completas (Self-Hosted)

```env
############
# Secrets - PRODUCCION BAZAR
############

POSTGRES_PASSWORD=QK0keXKCn8z7rpbdz8LhGiBJU9EmhlTzFjRf_cUDjH0
JWT_SECRET=EaV5MnuwBK3xQV8Y4OFxINGhOZvTaXkldVQ8n5LydqM
ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzcwMzMzMzA5LCJleHAiOjIwODU2OTMzMDl9.b3TRvq2MkUdRtewASheWBdRGUHUA26BkJcqY2q6vRjQ
SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NzAzMzMzMDksImV4cCI6MjA4NTY5MzMwOX0.K9eATdWmfTGqd4ZMtW92m4i_KXJBl-8QnvTDC_qEjIU
DASHBOARD_USERNAME=admin
DASHBOARD_PASSWORD=tW41lJCCVkB4nMK98_UCMQ
SECRET_KEY_BASE=rhfrWsrjdQMTUWRrWjEgj201OQm3AWQe5HNPj1xcD_0WxOLFJFebH13m7CDSUIL8CFXcEo-g0nFMPmlgzGbKUg
VAULT_ENC_KEY=EU2tn6ScQQ9VqnXVGCv4sm73DNpI2x5lNaeoFdPsz74

############
# Database
############

POSTGRES_HOST=db
POSTGRES_DB=postgres
POSTGRES_PORT=5432

############
# Supavisor - Database pooler
############

POOLER_PROXY_PORT_TRANSACTION=6543
POOLER_DEFAULT_POOL_SIZE=20
POOLER_MAX_CLIENT_CONN=100
POOLER_TENANT_ID=16eab4c0-d4cb-4179-b583-2d90e5cd58ec
POOLER_DB_POOL_SIZE=5

############
# API Proxy - Kong
############

KONG_HTTP_PORT=8000
KONG_HTTPS_PORT=8443

############
# API - PostgREST
############

PGRST_DB_SCHEMAS=public,storage,graphql_public

############
# Auth - GoTrue
############

SITE_URL=http://localhost:3000
ADDITIONAL_REDIRECT_URLS=
JWT_EXPIRY=3600
DISABLE_SIGNUP=false
API_EXTERNAL_URL=http://localhost:8000

MAILER_URLPATHS_CONFIRMATION="/auth/v1/verify"
MAILER_URLPATHS_INVITE="/auth/v1/verify"
MAILER_URLPATHS_RECOVERY="/auth/v1/verify"
MAILER_URLPATHS_EMAIL_CHANGE="/auth/v1/verify"

ENABLE_EMAIL_SIGNUP=true
ENABLE_EMAIL_AUTOCONFIRM=true
SMTP_ADMIN_EMAIL=admin@example.com
SMTP_HOST=supabase-mail
SMTP_PORT=2500
SMTP_USER=fake_mail_user
SMTP_PASS=fake_mail_password
SMTP_SENDER_NAME=BAZAR
ENABLE_ANONYMOUS_USERS=false

ENABLE_PHONE_SIGNUP=false
ENABLE_PHONE_AUTOCONFIRM=false

############
# Studio - Dashboard
############

STUDIO_DEFAULT_ORGANIZATION=BAZAR Importaciones
STUDIO_DEFAULT_PROJECT=Dashboard Inventario

STUDIO_PORT=3000
SUPABASE_PUBLIC_URL=http://localhost:8000

IMGPROXY_ENABLE_WEBP_DETECTION=true

OPENAI_API_KEY=

############
# Functions
############

FUNCTIONS_VERIFY_JWT=false

############
# Logs - Analytics
############

LOGFLARE_PUBLIC_ACCESS_TOKEN=i9ve4R3yqTf9rcYIGL6HTp0Ju9K_b5Zq9zW0FF0Aqjw
LOGFLARE_PRIVATE_ACCESS_TOKEN=Q8WLYG4Aa5gJjf-W-mQOiErWwR_nn7jKko3MZPKPg4c

DOCKER_SOCKET_LOCATION=/var/run/docker.sock

GOOGLE_PROJECT_ID=GOOGLE_PROJECT_ID
GOOGLE_PROJECT_NUMBER=GOOGLE_PROJECT_NUMBER
```

---

## Para Vercel (App BAZAR)

Actualizar estas variables en Vercel:

| Variable | Valor |
|----------|-------|
| `NEXT_PUBLIC_SUPABASE_URL` | `https://[TU-DOMINIO-SUPABASE]:8000` |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzcwMzMzMzA5LCJleHAiOjIwODU2OTMzMDl9.b3TRvq2MkUdRtewASheWBdRGUHUA26BkJcqY2q6vRjQ` |
| `SUPABASE_SERVICE_ROLE_KEY` | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NzAzMzMzMDksImV4cCI6MjA4NTY5MzMwOX0.K9eATdWmfTGqd4ZMtW92m4i_KXJBl-8QnvTDC_qEjIU` |

---

## Problema Actual: Error IPv6

El deploy falla por timeout de red IPv6 al descargar imagen de Kong.

### Solucion (ejecutar en VPS por SSH):

```bash
# Deshabilitar IPv6
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Reiniciar Docker
sudo systemctl restart docker

# Reintentar deploy desde EasyPanel
```

---

## Archivos Relacionados

- `sql/full_schema_consolidated.sql` - Schema completo de la BD
- `supabase-docker/.env.production` - Archivo .env completo
