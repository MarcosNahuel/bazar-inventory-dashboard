# Configuración de MCP Servers

Configuración para replicar los MCP servers de este proyecto (sin Supabase).

## MCP Servers Configurados

### n8n MCP Server

```json
{
  "n8n-mcp": {
    "command": "npx",
    "args": [
      "-y",
      "@n8n/mcp-server"
    ],
    "env": {
      "N8N_API_URL": "<TU_URL_N8N>",
      "N8N_API_KEY": "<TU_API_KEY_N8N>"
    }
  }
}
```

**Instalación:** Se instala automáticamente vía npx.

**Variables requeridas:**
- `N8N_API_URL`: URL de tu instancia n8n (ej: `https://tu-n8n.easypanel.host`)
- `N8N_API_KEY`: API Key generado desde n8n > Settings > API

---

## Plugins Oficiales de Claude

Estos plugins se habilitan desde la configuración de Claude Code:

```json
{
  "enabledPlugins": {
    "frontend-design@claude-plugins-official": true,
    "superpowers@superpowers-marketplace": true
  }
}
```

---

## MCP Servers del Proyecto

En el archivo `.claude/settings.local.json` del proyecto:

```json
{
  "enableAllProjectMcpServers": true,
  "enabledMcpjsonServers": [
    "github",
    "vercel",
    "context7",
    "next-devtools"
  ]
}
```

Estos son MCP servers integrados en Claude Code que se habilitan por proyecto.

---

## Configuración Completa (settings.json)

Ubicación: `~/.claude/settings.json` (Windows: `C:\Users\<usuario>\.claude\settings.json`)

```json
{
  "enabledPlugins": {
    "frontend-design@claude-plugins-official": true,
    "superpowers@superpowers-marketplace": true
  },
  "mcpServers": {
    "n8n-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "@n8n/mcp-server"
      ],
      "env": {
        "N8N_API_URL": "<TU_URL_N8N>",
        "N8N_API_KEY": "<TU_API_KEY_N8N>"
      }
    }
  }
}
```

---

## Configuración por Proyecto (.claude/settings.local.json)

```json
{
  "enableAllProjectMcpServers": true,
  "enabledMcpjsonServers": [
    "github",
    "vercel",
    "context7",
    "next-devtools"
  ]
}
```

---

## Resumen de MCP Disponibles

| MCP Server | Tipo | Uso |
|------------|------|-----|
| `n8n-mcp` | Custom | Automatización de workflows n8n |
| `github` | Integrado | Gestión de repos, PRs, issues |
| `vercel` | Integrado | Deploy, proyectos, dominios |
| `context7` | Integrado | Documentación de librerías |
| `next-devtools` | Integrado | DevTools para Next.js |
| `frontend-design` | Plugin | Diseño de interfaces |
| `superpowers` | Plugin | Skills avanzados |
