Lsp = Require('lspconfig')

-- LspConfig setting border
local win = Require 'lspconfig.ui.windows'

local _default_opts = win.default_opts

win.default_opts = function()
    local opts = _default_opts()
    opts.border = 'single'
    return opts
end

On_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    local keymaps = {
        { 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts },
        { 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts },
        { 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts },
        { 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts },
        { 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts },
        {
            'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
            opts,
        },
        {
            'n', '<space>wr',
            '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts,
        }, {
            'n', '<space>wl',
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            opts,
        },
        { 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts },
        { 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts },
        { 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts },
        { 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts }, {
            'n', '<space>e',
            '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>',
            opts,
        }, { 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts },
        { 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts },
        { 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts },
        { 'n', '<space>b', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opts },
    }

    for _, v in pairs(keymaps) do
        local m, k, c, o = unpack(v)
        buf_set_keymap(m, k, c, o)
    end
    Cmd [[
        autocmd BufEnter,CursorHold,InsertLeave *.hs lua vim.lsp.codelens.refresh()
    ]]
end

-- BORDERS

vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    })

local signs = {
    Error = ' ',
    Warning = ' ',
    Warn = ' ',
    Hint = ' ',
    Information = ' ',
    Info = ' ',
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

