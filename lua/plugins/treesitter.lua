Require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'haskell', 'elm', 'lua', 'vim', 'c', 'python', 'cpp' },
    playground = {
        enable = true,
        disable = {},
        -- Debounced time for highlighting nodes in the playground from source code
        updatetime = 25,
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        use_languagetree = true,
        disable = { 'c', 'rust' }, -- list of language that will be disabled
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ['constant'] = 'TSConstant',
            ['prelude'] = 'Prelude',
            ['punctuation.record'] = 'TSOperator',
            ['macro'] = 'haskellTSExtension',
            ['hsnamespace'] = 'haskellTSNamespace',
            ['hsconstructor'] = 'haskellTSConstrucotr',
            ['hstype'] = 'haskellTSType',
            ['hsfunction'] = 'haskellTSType',
            ['punctuation.special'] = 'TSKeyword',
            ['character'] = 'TSCharacter',
            ['hsoperator'] = 'haskellTSOperator',
        },
        -- Setting this to true will run `:h syntax`
        -- and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax'
        -- being enabled (like for indentation).
        -- Using this option may slow down your editor,
        -- and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

local function readAll(file)
    local f = assert(io.open(file, 'rb'))
    local content = f:read('*all')
    f:close()
    return content
end

local hs_highloghts =
    readAll '/home/meiram/.config/nvim/lua/queries/haskell/highlights.scm'

require'vim.treesitter.query'.set_query('haskell', 'highlights', hs_highloghts)

