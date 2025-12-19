# Configuracion de MCP Tools para Claude Code

Este documento describe como configurar los servidores MCP (Model Context Protocol) utilizados en este proyecto para replicar en otros proyectos.

## Ubicacion de Archivos de Configuracion

### Windows
- **Configuracion Global de Claude Code**: `C:\Users\<USUARIO>\.claude.json`
- **Configuracion de Claude Desktop**: `C:\Users\<USUARIO>\.claude\claude_desktop_config.json`

### macOS/Linux
- **Configuracion Global de Claude Code**: `~/.claude.json`
- **Configuracion de Claude Desktop**: `~/.claude/claude_desktop_config.json`

---

## Servidores MCP Configurados en Este Proyecto

### 1. GitHub MCP Server
Permite interactuar con repositorios de GitHub (crear issues, PRs, branches, etc.)

```json
{
  "github": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-github"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_XXXXXXXXXXXXXXXXXX"
    }
  }
}
```

**Obtener token**: https://github.com/settings/tokens
- Permisos necesarios: `repo`, `read:user`, `read:org`

---

### 2. Supabase MCP Server
Permite ejecutar queries SQL, gestionar migraciones y proyectos de Supabase.

```json
{
  "supabase": {
    "type": "http",
    "url": "https://mcp.supabase.com/mcp"
  }
}
```

**Nota**: Requiere autenticacion OAuth (se configura automaticamente al conectar)

---

### 3. Context7 MCP Server
Proporciona documentacion actualizada de librerias y frameworks.

```json
{
  "context7": {
    "type": "http",
    "url": "https://mcp.context7.com/mcp",
    "headers": {
      "Authorization": "Bearer ctx7sk-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
    }
  }
}
```

**Obtener token**: https://context7.com (crear cuenta gratuita)

---

### 4. Vercel MCP Server
Permite gestionar deployments, proyectos y dominios en Vercel.

```json
{
  "vercel": {
    "type": "http",
    "url": "https://mcp.vercel.com"
  }
}
```

**Nota**: Requiere autenticacion OAuth (se configura automaticamente al conectar)

---

### 5. Chrome DevTools MCP Server
Permite automatizar navegador Chrome para testing, screenshots y debugging.

```json
{
  "chrome-devtools": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "chrome-devtools-mcp@latest"]
  }
}
```

**Requisitos**:
- Node.js instalado
- Chrome/Chromium instalado en el sistema

---

## Configuracion Completa para Este Proyecto

Agregar al archivo `~/.claude.json` en la seccion `mcpServers`:

```json
{
  "mcpServers": {
    "github": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "TU_TOKEN_GITHUB"
      }
    },
    "supabase": {
      "type": "http",
      "url": "https://mcp.supabase.com/mcp"
    },
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "Authorization": "Bearer TU_TOKEN_CONTEXT7"
      }
    },
    "vercel": {
      "type": "http",
      "url": "https://mcp.vercel.com"
    },
    "chrome-devtools": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

---

## Configuracion por Proyecto

Para configurar MCP servers especificos para un proyecto, agregar la configuracion en la seccion `projects` del archivo `~/.claude.json`:

```json
{
  "projects": {
    "D:\\ruta\\a\\tu\\proyecto": {
      "mcpServers": {
        "github": {
          "type": "stdio",
          "command": "npx",
          "args": ["-y", "@modelcontextprotocol/server-github"],
          "env": {
            "GITHUB_PERSONAL_ACCESS_TOKEN": "TU_TOKEN"
          }
        }
      }
    }
  }
}
```

---

## Otros MCP Servers Utiles

### N8N MCP Server
Para automatizaciones con n8n:

```json
{
  "n8n": {
    "type": "stdio",
    "command": "node",
    "args": ["ruta/a/node_modules/@illuminaresolutions/n8n-mcp-server/build/index.js"],
    "env": {
      "N8N_HOST": "https://tu-instancia-n8n.com",
      "N8N_API_KEY": "tu-api-key"
    }
  }
}
```

**Instalacion**: `npm install @illuminaresolutions/n8n-mcp-server`

---

## Herramientas Disponibles por MCP

### GitHub
- `mcp__github__create_repository` - Crear repositorios
- `mcp__github__create_issue` - Crear issues
- `mcp__github__create_pull_request` - Crear PRs
- `mcp__github__get_file_contents` - Leer archivos
- `mcp__github__push_files` - Subir archivos
- `mcp__github__create_branch` - Crear ramas
- `mcp__github__merge_pull_request` - Mergear PRs

### Supabase
- `mcp__supabase__execute_sql` - Ejecutar SQL
- `mcp__supabase__apply_migration` - Aplicar migraciones
- `mcp__supabase__list_tables` - Listar tablas
- `mcp__supabase__get_logs` - Ver logs
- `mcp__supabase__deploy_edge_function` - Deployar funciones

### Vercel
- `mcp__vercel__deploy_to_vercel` - Deployar
- `mcp__vercel__list_deployments` - Ver deployments
- `mcp__vercel__get_deployment_build_logs` - Ver logs de build
- `mcp__vercel__search_vercel_documentation` - Buscar documentacion

### Chrome DevTools
- `mcp__chrome-devtools__navigate_page` - Navegar a URL
- `mcp__chrome-devtools__take_screenshot` - Tomar screenshot
- `mcp__chrome-devtools__take_snapshot` - Snapshot del DOM
- `mcp__chrome-devtools__click` - Click en elementos
- `mcp__chrome-devtools__fill` - Llenar inputs
- `mcp__chrome-devtools__evaluate_script` - Ejecutar JS

### Context7
- `mcp__context7__resolve-library-id` - Buscar libreria
- `mcp__context7__get-library-docs` - Obtener documentacion

---

## Comandos Utiles de Claude Code

```bash
# Ver servidores MCP configurados
/mcp

# Habilitar/deshabilitar servidor MCP
/mcp enable <nombre>
/mcp disable <nombre>

# Ver estado de MCP
/mcp status
```

---

## Troubleshooting

### Error: MCP server not connecting
1. Verificar que Node.js este instalado: `node --version`
2. Verificar que npx este disponible: `npx --version`
3. Reiniciar Claude Code

### Error: GitHub authentication failed
1. Verificar que el token tenga los permisos correctos
2. Regenerar el token si expiro
3. Verificar que el token este bien copiado (sin espacios)

### Error: Chrome DevTools no funciona
1. Cerrar todas las instancias de Chrome
2. Verificar que Chrome este instalado
3. Ejecutar `npx chrome-devtools-mcp@latest` manualmente para ver errores

---

## Referencias

- [MCP Official Documentation](https://modelcontextprotocol.io/)
- [Claude Code Documentation](https://code.claude.com/docs)
- [GitHub MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/github)
- [Supabase MCP](https://supabase.com/docs/guides/ai/mcp)
- [Context7](https://context7.com)
