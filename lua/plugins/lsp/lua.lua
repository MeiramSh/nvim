local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

Require'lspconfig'.sumneko_lua.setup {
    on_attach = On_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    },
}

local lua_format_opts = {
    '-i', '--double-quote-to-single-quote', '--extra-sep-at-table-end',
    '--spaces-inside-table-braces', '--indent-width=' .. vim.o.tabstop,
    '--column-limit=81',
}

local lua_format_cmd = 'lua-format'

for _, value in pairs(lua_format_opts) do
    lua_format_cmd = lua_format_cmd .. ' ' .. value
end

Require'lspconfig'.efm.setup {
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            lua = { { formatCommand = lua_format_cmd, formatStdin = true } },
        },
    },
    filetypes = { 'lua' },
}
