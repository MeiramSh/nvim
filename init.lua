cmd = vim.api.nvim_command
join_paths = require'packer.util'.join_paths

cmd ('set packpath+='..join_paths(vim.fn.stdpath('config'), 'plugins', 'packer'))
cmd [[
let g:neovide_remember_window_size = v:true
highlight MatchParen ctermfg=4 ctermbg=0
highlight Comment ctermfg=8
set number relativenumber
set shiftwidth=2
"set guifont=NotoSansMono-Regular-Nerd-Font-Complete
]]

-----------------------------------------------------------------------------------
-- UTILS
-----------------------------------------------------------------------------------

function map(tbl, f)
  local t = {}
  for k,v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

-----------------------------------------------------------------------------------
-- PACKER
-----------------------------------------------------------------------------------

local function safe_req(arg)
  local module = require(arg)
  if not module then
    cmd 'PackerSync'
    return require(arg)
  else
    return module
  end
end
	
local packer = require 'packer'
local use = packer.use 

packer.init { package_root = join_paths(vim.fn.stdpath('config'), 'plugins') }

use 'wbthomason/packer.nvim'
use 'windwp/nvim-autopairs'
use 'neovim/nvim-lspconfig'
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/playground'
use 'hkupty/iron.nvim'

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

use 'hrsh7th/vim-vsnip'

use 'Mofiqul/dracula.nvim'
use 'projekt0n/github-nvim-theme'

use { 'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
}

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
}


-----------------------------------------------------------------------------------
-- AUTOPAIRS
-----------------------------------------------------------------------------------

require('nvim-autopairs').setup{}


-----------------------------------------------------------------------------------
-- LSPCONFIG
-----------------------------------------------------------------------------------

local nvim_lsp = require('lspconfig')

-- LspConfig setting border
local win = require 'lspconfig.ui.windows'

local _default_opts = win.default_opts

win.default_opts = function()
  local opts = _default_opts()
  opts.border = 'single'
  return opts
end


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  
  keymaps = {
    {'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts},
    {'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts},
    {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts},
    {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts},
    {'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts},
    {'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts},
    {'n', '<space>wr',
      '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts},
    {'n', '<space>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts},
    {'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts},
    {'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts},
    {'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts},
    {'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts},
    {'n', '<space>e',
      '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>',
      opts},
    {'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts},
    {'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts},
    {'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts},
    {'n', '<space>b', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts},
  }

  for _,v in pairs(keymaps) do 
    m, k, c, o = unpack(v)
    buf_set_keymap(m, k, c, o)
  end
end

-- HASKELL
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

configs.hls = {
  default_config = {
    cmd = { 'haskell-language-server-wrapper', '--lsp' },
    filetypes = { 'haskell', 'lhaskell' },
    root_dir = util.root_pattern('*.cabal', 'stack.yaml', 'cabal.project',
      'package.yaml', 'hie.yaml'),
    settings = {
      haskell = {
        formattingProvider = 'ormolu',
      },
    },
    lspinfo = function(cfg)
      local extra = {}
      local function on_stdout(_, data, _)
        local version = data[1]
        table.insert(extra, 'version:   ' .. version)
      end

      local opts = {
        cwd = cfg.cwd,
        stdout_buffered = true,
        on_stdout = on_stdout,
      }
      local chanid = vim.fn.jobstart({ cfg.cmd[1], '--version' }, opts)
      vim.fn.jobwait { chanid }
      return extra
    end,
  },

  docs = {
    description = [[
https://github.com/haskell/haskell-language-server
Haskell Language Server
        ]],

    default_config = {
      root_dir = [[
	root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml")
      ]],
    },
  },
}

-- BORDERS
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-----------------------------------------------------------------------------------
--TREESITTER
-----------------------------------------------------------------------------------

require'nvim-treesitter.configs'.setup {
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
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
    disable = { "c", "rust" },  -- list of language that will be disabled
    custom_captures = {
	-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
	["signature.name"] = 'SignatureName',
	['constant'] = 'TSConstant',
	['prelude'] = 'Prelude',
	['punctuation.record'] = 'TSOperator'
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


-----------------------------------------------------------------------------------
-- TELESCOPE
-----------------------------------------------------------------------------------

function readOnly (t)
  local proxy = {}
  local mt = {       -- create metatable
    __index = t,
    __newindex = function (t,k,v)
      error("attempt to update a read-only table", 2)
    end
  }
  setmetatable(proxy, mt)
  return proxy
end



local telescope = require'telescope'
local builtin = require'telescope.builtin' --Maybe

telescope.setup { defaults = { file_ignore_patterns = {"node_modules", ".git"} } }

local files_search_dirs = { '$HOME/Dev', '$HOME/.config/nvim','$HOME/.config/alacritty' }

find = readOnly {
  files = function() builtin.find_files({ hidden = true, search_dirs = files_search_dirs }) end, 
  live_grep = function() builtin.live_grep { search_dirs = files_search_dirs } end,
  buffers = function() builtin.buffers() end,
  help_tags = function() builtin.help_tags() end,
}

telescope.load_extension('fzf')

cmd[[
nnoremap <space>ff <cmd>lua find.files()<cr>
nnoremap <space>fg <cmd>lua find.live_grep()<cr>
nnoremap <space>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <space>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]


-----------------------------------------------------------------------------------
-- ALPHA
-----------------------------------------------------------------------------------

local alpha = require'alpha'
local dashboard = require("alpha.themes.dashboard")
local str = ''
-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":lua find.files()<cr>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h <CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])


-----------------------------------------------------------------------------------
-- CMP
-----------------------------------------------------------------------------------

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = 
	require'cmp_nvim_lsp'.update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['hls'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}


-----------------------------------------------------------------------------------
-- GITHUB-THEME
-----------------------------------------------------------------------------------

require('github-theme').setup (
  --theme_style = "dark",
)


-----------------------------------------------------------------------------------
-- LUALINE
-----------------------------------------------------------------------------------

require'lualine'.setup {
    options = {
	theme = 'github'
    }, 
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    },
}


-----------------------------------------------------------------------------------
-- IRON
-----------------------------------------------------------------------------------

local iron = require('iron')

iron.core.set_config {
  preferred = {
    haskell = 'stack',
  },
  repl_open_cmd = 'vertical bo 80 split',
}



-----------------------------------------------------------------------------------
-- WEBDEVICONS
-----------------------------------------------------------------------------------

require'nvim-web-devicons'.setup {}
