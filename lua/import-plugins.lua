Require'nvim-autopairs'.setup {}

-- LSPCONFIG
Require 'plugins.lsp'

Require 'plugins.lsp.haskell'

-- ELM
Lsp.elmls.setup { on_attach = On_attach }

-- C
Lsp.clangd.setup {
    on_attach = On_attach,
    cmd = { 'clangd', '--fallback-style=InheritParentConfig' },
}

Require 'plugins.lsp.lua'

Require 'plugins.treesitter'

Require 'plugins.telescope'

Require 'plugins.alpha'

Require 'plugins.cmp'
-- GITHUB
-- Replace_module('github-theme.colors', 'plugins.my-github')
-- Replace_module('github-theme.theme', 'plugins.my-github.theme')

Require'github-theme'.setup {}
--    colors = {
--        bg = '#0d1117',
--        fg = '#c9d1d9',
--        red = '#ff7b72',
--        purple = '#d2a8ff',
--        green = '#7ee787',
--        syntax = {
--            string = '#a5d6ff',
--            keyword = '#ff7b72',
--            variable = '#c9d1d9',
--            func = '#79c0ff',
--            func_param = '#c9d1d9',
--        },
--    },
-- }

Require'lualine'.setup {
    -- options = { theme = 'github' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch', 'diff', { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
}

local iron = Require 'iron'

iron.core.set_config {
    preferred = { haskell = 'stack' },
    repl_open_cmd = 'vertical bo 80 split',
}

-- WEBDEVICONS
Require'nvim-web-devicons'.setup {}

Require'plenary.filetype'.add_file 'sql'

Require 'plugins.indent-blankline'
