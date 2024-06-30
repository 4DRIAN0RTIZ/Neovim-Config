lua << EOF
-- Requiere las configuraciones iniciales y plugins necesarios
require'lspconfig'.html.setup{}
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- Detectar automáticamente qué servidores instalar (basado en los que se configuran a través de lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
require'telescope'.load_extension('live_grep_args')
require("chatgpt").setup()
require("catppuccin").setup({
    flavour = "macchiato"
})
-- Configuración de WhichKey
require("which-key").setup {
    plugins = {
        marks = true, -- Muestra los marcadores
        registers = true, -- Muestra los registros
        spelling = {
            enabled = true, -- Habilita la revisión ortográfica
            suggestions = 20, -- Muestra 20 sugerencias
        },
        presets = {
            operators = true, -- Muestra los operadores
            motions = true, -- Muestra los movimientos
            text_objects = true, -- Muestra los objetos de texto
            windows = true, -- Muestra los comandos de ventana
            nav = true, -- Muestra los comandos de navegación
            z = true, -- Muestra los comandos de plegado
            g = true, -- Muestra los comandos de Git
        },
    },
}
-- Configuración de Trouble
require("trouble").setup {
    auto_preview = false, -- Deshabilita la vista previa automática
    auto_fold = true, -- Habilita el plegado automático
    use_lsp_diagnostic_signs = true, -- Usa los signos de diagnóstico LSP
}
-- Configuración de Noice
require("noice").setup({
    auto_preview = false, -- Deshabilita la vista previa automática
    auto_fold = true, -- Habilita el plegado automático
    use_lsp_diagnostic_signs = true, -- Usa los signos de diagnóstico LSP
})
require("notify").setup({
    stages = "slide",
    timeout = 5000,
    background_colour = "#000000",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
    position = {
      row = 10,
      col = "50%",
    },
})
require("nvim-tree").setup({
    view = {
        width = 30, -- Ancho de la ventana
        side = "right", -- Lado de la ventana
    },
    filters = {
        dotfiles = false, -- Muestra los archivos ocultos
        custom = {
          "node_modules", -- Oculta la carpeta node_modules
          "^\\.git", -- Oculta la carpeta .git
        },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
})
EOF
