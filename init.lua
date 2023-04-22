-- options
vim.g.mapleader = ' '
vim.o.shell = '/bin/zsh'
vim.o.expandtab = true -- space instead of tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.spell = true
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.laststatus = 3


-- bootstrapping lazy.nvim
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


-- plugins
require 'lazy'.setup {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    main = 'ufo',
    opts = {
      provider_selector = function()
        -- return { 'treesitter', 'indent' }
        return 'indent'
      end,
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,  -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },

  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
  },
  'stevearc/dressing.nvim',
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      vim.cmd [[highlight Comment guifg=#7dcfff]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'folke/which-key.nvim',
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
  },
  'neovim/nvim-lspconfig',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',         -- snippet engine
      'hrsh7th/cmp-nvim-lsp',     -- lsp
      'saadparwaiz1/cmp_luasnip', -- snippets
      'hrsh7th/cmp-buffer',       -- text in buffer
      'hrsh7th/cmp-cmdline',      -- neovim commands
    },
    config = function()
      local cmp = require 'cmp' -- nvim-cmp
      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        -- window is deleted

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
          { name = 'nvim_lsp' }, -- cmp_nvim_lsp
          { name = 'luasnip' },  -- For luasnip users.
        }, {
          { name = 'buffer' },   -- cmp-buffer
        }),

      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }, -- cmp-buffer
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources { -- 'path' is deleted
          { name = 'cmdline' },        -- cmp-cmdline
        },
      })
    end,
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⣿⡟⠉⠀⠀⣼⣿⢯⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠹⣿⣿⣿⠀⠈⠉⢿⣿⣿⣿⣿⣿⡍⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⢸⣏⢿⣿⣿⣿⣿⠇⠀⠀⢸⡿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⠻⣿⣇⠘⣿⣿⠀⢀⡀⢻⣿⣿⣿⣿⡿⢟⡇⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠸⣿⡄⢻⣿⣿⣿⠀⠀⠀⢸⡇⣾⠋⣿⣿⡿⢁⣿⣿⡟⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢻⣿⣿⠀⠹⣿⡀⢻⣿⠴⠋⠀⢘⣿⣿⣿⣿⢷⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⣿⣽⡄⢹⣿⣿⠀⠀⠀⠀⠧⡟⠀⣿⣿⠁⢸⣿⡏⠀⣿⡇⢻⣿⣿⣿⣿⣿⣿⡟⣿⡇⠀⢿⣿⠀⠀⢹⡧⣿⠁⠀⠀⠀⢨⣿⣿⣿⠃⣾⣽⣷⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⡟⢸⡿⣾⣿⣿⡇⠀⠀⠀⠀⢹⡀⠈⣏⠀⠸⣿⠀⠀⢸⠛⣿⣿⣿⣿⣿⣿⠿⣳⣿⠀⠀⣸⣿⠀⢀⣼⠇⠀⠀⠀⠀⠀⠰⣿⣿⣿⣼⡍⠃⣿⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⣿⣌⢧⣸⣿⠿⢧⠀⠀⠀⣀⠀⠁⠀⢻⠀⠀⣿⢦⠘⠾⣇⠹⣿⣿⡟⢻⡿⢰⠏⡟⠀⣼⣿⣧⠞⠉⠁⣀⣠⣀⣀⠀⢀⣰⠟⢻⣿⣻⣇⣴⡟⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠘⢯⠻⢿⣿⡆⠘⢿⣾⣿⣿⣿⣶⣤⣀⣀⣀⠀⣀⣀⡀⠈⠀⠸⣿⡇⣸⣷⠏⠘⠁⣀⣉⣀⣀⣤⣴⣾⣿⣿⣿⣿⣿⠟⠁⠀⣸⢋⡟⢫⡞⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠈⢳⣾⣯⡁⠀⠀⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣠⣿⡇⣿⣏⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⠁⠀⠀⠀⣿⣿⠇⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠈⣧⠀⠀⠀⠀⢻⣿⣿⣷⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢷⣿⣿⣿⣿⣿⣿⡟⠛⠉⠛⠛⠁⠀⣠⣿⠃⠀⠀⠀⠀⣿⡇⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣿⡄⠀⠀⠀⠀⠻⣿⣻⣿⣿⡉⠉⢹⣿⣿⡿⠃⠘⠆⠀⠀⠸⠁⠈⠿⣿⣿⣶⣤⣤⣤⣴⣾⡿⠃⠀⠀⠀⠀⢠⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣧⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠀⠈⠉⠉⠀⠀⠀⠀⢠⡀⠀⠀⢸⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⡀⣼⢸⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⣀⣀⣀⣀⣠⣄⡀⠀⢸⡄⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠓⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀⣰⠇⢸⣶⣶⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀]],
        [[⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⡇⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣤⡄⠀⠀⠀⠀⢀⣤⡤⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⢀⢺⣶⠏⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀]],
        [[⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠈⢿⡄⠀⠀⢴⡶⠂⠀⠀⠀⠀⠀⢰⡋⠀⠀⠀⠀⠀⠀⢙⡆⠀⠀⠀⠀⠀⠀⢀⣼⠟⠀⠁⣸⡏⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⠀⠀⠻⣧⠀⠈⢿⣦⣄⠀⠀⠀⠀⠀⢻⣆⠀⠀⠀⠀⣰⡟⠁⠀⠀⠀⠀⣀⣴⠏⠀⠰⢆⣾⠟⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣆⠀⠀⠙⣧⡀⠈⢽⣿⣷⣤⣄⣀⣀⣈⣿⣷⣤⣴⣾⣟⣀⣀⣠⣤⣴⣾⣿⣣⠆⠀⢰⣾⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠘⣿⡆⠘⢻⣿⣷⣏⠛⢿⠛⣿⠉⢽⡏⠀⣿⠁⢿⢃⣿⣿⡿⣱⣯⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⡿⣜⠿⣿⣾⣧⣼⣄⣰⣧⣠⣿⣴⣿⣿⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
        dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButtons'
      dashboard.section.footer.opts.hl = 'AlphaFooter'
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'AlphaReady',
          callback = function()
            require 'lazy'.show()
          end,
        })
      end

      require 'alpha'.setup(dashboard.opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require 'lazy'.stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val =
              '⚡ Neovim loaded ' .. stats.count
              .. ' plugins in ' .. ms .. 'ms'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}


-- diagnostics icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- autocommands
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   callback = function(_) vim.lsp.buf.format() end,
-- })


-- remember folds
vim.cmd [[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]]


-- keymaps
require 'which-key'.register(
  {
    l = {
      name = '+lsp',
      h = { vim.lsp.buf.hover, 'hover' },
      n = { vim.lsp.buf.rename, 'rename' },
      r = { vim.lsp.buf.references, 'references' },
      d = { vim.lsp.buf.definition, 'definition' },
      a = { vim.lsp.buf.code_action, 'code action' },
      e = { vim.diagnostic.open_float, 'diagnostics' },
    },
    t = {
      name = '+telescope',
      k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
      d = { '<cmd>Telescope diagnostics<cr>', 'diagnostics' },
      l = { '<cmd>Telescope live_grep<cr>', 'livegrep' },
      f = { '<cmd>Telescope git_files<cr>', 'files' },
      s = { '<cmd>Telescope lsp_document_symbols<cr>', 'symbols' },
    },
  },
  { prefix = '<leader>' }
)

require 'which-key'.register(
  {
    l = {
      name = '+lsp',
      f = { vim.lsp.buf.format, 'format selection' },
    },
  },
  {
    prefix = '<leader>',
    mode = 'v'
  }
)


-- syntax highlighting
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'c', 'cpp', 'python' },
  sync_install = false,
}


-- completions for lsp
local capabilities = require 'cmp_nvim_lsp'.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  'clangd', 'tsserver', 'html', 'tailwindcss', 'emmet_ls', 'pyright'
}

for _, v in pairs(servers) do
  require 'lspconfig'[v].setup { capabilities = capabilities }
end

local on_attach = function(_, _)
  vim.api.nvim_create_autocmd('CursorHold', {
    callback = vim.diagnostic.open_float,
  })
end


-- language specific lsp configuration
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
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
          call_arg_parentheses = 'remove',
          trailing_table_separator = 'smart'
        },
      },
      diagnostics = {
        globals = { 'vim' },
        disable = { 'redundant-parameter' },
      },
    },
  }, capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.hls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
