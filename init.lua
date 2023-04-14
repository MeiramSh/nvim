-- utils
local function set_colorscheme(colorscheme)
  for i, value in ipairs(vim.api.nvim_list_runtime_paths()) do
    if string.match(value, colorscheme .. '%.n?vim') then
      vim.cmd('colorscheme ' .. colorscheme)
      break
    end

    if i == #vim.api.nvim_list_runtime_paths() then
      print('The colorscheme ' .. colorscheme .. ' is not installed!')
    end
  end
end

-- options
vim.g.mapleader = ' '
vim.o.shell = '/bin/zsh'
vim.o.expandtab = true -- space instead of tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.opt.mouse = 'a'
vim.opt.hidden = true

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup {
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      vim.cmd [[highlight Comment guifg=#7dcfff]]
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    deps = { 'kyazdani42/nvim-web-devicons', lazy = false },
    config = true
  },
  {
    'windwp/nvim-autopairs',
    config = true
  },
  {
    'numToStr/Comment.nvim',
    config = true
  },
  {
    'folke/which-key.nvim',
    config = true
  },
  {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'lua', 'c', 'cpp', 'python' },
    }
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  {
    'hrsh7th/nvim-cmp',
    deps = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {},
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-e>'] = cmp.mapping.abort(),

          -- Accept currently selected item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })

      }
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(_) vim.lsp.buf.format() end
})

require 'which-key'.register({
    l = {
      name = '+lsp',
      h = { vim.lsp.buf.hover, 'hover' },
      n = { vim.lsp.buf.rename, 'rename' },
      r = { vim.lsp.buf.references, 'references' },
      d = { vim.lsp.buf.definition, 'definition' },
      a = { vim.lsp.buf.code_action, 'code action' },
      e = { vim.diagnostic.open_float, 'diagnostics' },
    },
  },
  { prefix = '<leader>' }
)

local capabilities = require 'cmp_nvim_lsp'.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  'clangd', 'tsserver', 'html', 'tailwindcss', 'emmet_ls', 'pyright'
}

for _, v in pairs(servers) do
  require 'lspconfig'[v].setup { capabilities = capabilities, }
end

local on_attach = function(_, _)
  vim.api.nvim_create_autocmd('CursorHold', {
    callback = vim.diagnostic.open_float
  })
end

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace'
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          quote_style = 'single',
          call_arg_parentheses = 'remove'
        }
      },
      diagnostics = { globals = { 'vim' } }
    }
  }, capabilities = capabilities,
  on_attach = on_attach
}

require 'lspconfig'.hls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

if false then
  set_colorscheme 'tokyonight'
end
