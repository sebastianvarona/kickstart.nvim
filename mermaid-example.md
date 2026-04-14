# Ejemplo de Mermaid en Neovim

Este archivo demuestra cómo usar diagramas Mermaid en Markdown con tu configuración de Neovim.

## Atajos disponibles

| Atajo | Descripción |
|-------|-------------|
| `<leader>mp` | Abrir/cerrar previsualización en navegador |
| `<leader>ms` | Iniciar previsualización |
| `<leader>mq` | Cerrar previsualización |
| `<leader>mt` | Toggle renderizado en Neovim |

---

## Diagrama de Flujo

```mermaid
flowchart TD
    A[Inicio] --> B{¿Es válido?}
    B -->|Sí| C[Procesar]
    B -->|No| D[Error]
    C --> E[Fin]
    D --> E
```

## Diagrama de Secuencia

```mermaid
sequenceDiagram
    actor Usuario
    participant Nvim
    participant Browser

    Usuario->>Nvim: Editar archivo .md
    Usuario->>Nvim: <leader>mp
    Nvim->>Browser: Iniciar preview
    Browser->>Browser: Renderizar Mermaid
    Browser-->>Usuario: Mostrar diagrama
```

## Diagrama de Clases

```mermaid
classDiagram
    class Neovim {
        +String version
        +init()
        +edit()
    }
    class Plugin {
        +String name
        +setup()
    }
    class MarkdownPreview {
        +toggle()
        +refresh()
    }

    Neovim *-- Plugin : contiene
    Plugin <|-- MarkdownPreview : extiende
```

## Diagrama de Estado

```mermaid
stateDiagram-v2
    [*] --> Inactivo
    Inactivo --> Editando : abrir archivo
    Editando --> Guardado : :w
    Guardado --> Editando : editar
    Editando --> Previsualizando : <leader>mp
    Previsualizando --> Editando : <leader>mq
    Guardado --> [*] : :q
```

## Gráfico de Git

```mermaid
gitGraph
    commit id: "inicio"
    branch feature
    checkout feature
    commit id: "agregar mermaid"
    commit id: "configurar plugins"
    checkout main
    merge feature id: "merge mermaid"
    commit id: "disfrutar"
```

## Diagrama de Gantt

```mermaid
gantt
    title Proyecto Mermaid en Neovim
    dateFormat  YYYY-MM-DD
    section Configuración
    Instalar plugins     :done, a1, 2026-03-26, 1d
    Configurar Mermaid   :done, a2, after a1, 1d
    section Uso
    Crear diagramas      :active, a3, after a2, 2d
    Previsualizar        :a4, after a3, 1d
```

## Diagrama de Pie

```mermaid
pie title Distribución de uso de plugins
    "render-markdown" : 60
    "markdown-preview" : 30
    "Otros" : 10
```

---

> [!TIP]
> Usa `<leader>mp` para ver estos diagramas renderizados en tu navegador!

> [!NOTE]
> `render-markdown.nvim` mejora la visualización dentro de Neovim, mientras que `markdown-preview.nvim` renderiza en el navegador con soporte completo de Mermaid.
