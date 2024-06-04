-- OPTIONS: BEGIN
vim.g.mapleader = ' '
vim.o.shell = '/bin/zsh'
vim.o.expandtab = true -- space instead of tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.spell = true
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.laststatus = 3
vim.opt.termguicolors = true
-- OPTIONS: END


-- DASHBOARD PICTURE: BEGIN
local picture = {
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
  [[]], -- this is mandatory
}
-- DASHBOARD PICTURE: END


-- BOOTSTRAPPING LAZY.NVIM: BEGIN
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
-- BOOTSTRAPPING LAZY.NVIM: END


-- PLUGINS: BEGIN
require 'lazy'.setup {
  {
    'Exafunction/codeium.vim',
    config = function()
      vim.keymap.set('i', '<C-g>',
        function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-q>',
        function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true })
      vim.keymap.set('i', '<c-a>',
        function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true })
      vim.keymap.set('i', '<c-x>',
        function() return vim.fn['codeium#Clear']() end, { expr = true })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    config = function()
      vim.fn['mkdp#util#install']()
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        desc = 'disable tabline for alpha',
        callback = function()
          vim.opt.showtabline = 0
        end,
      })
      vim.api.nvim_create_autocmd('BufUnload', {
        buffer = 0,
        desc = 'enable tabline after alpha',
        callback = function()
          vim.opt.showtabline = 2
          require 'bufferline'.setup {}
        end,
      })
      vim.api.nvim_create_autocmd('BufEnter', {
        buffer = 0,
        desc = 'enable tabline after alpha',
        callback = function()
          vim.opt.showtabline = 2
          require 'bufferline'.setup {}
        end,
      })
    end,
  },
  { 'nvim-treesitter/playground' },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
        user_default_options = {
          mode = 'virtualtext',
        },
      }
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    main = 'ufo',
    config = function()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
      vim.cmd('highlight FoldColumn guifg=' ..
        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID 'Comment'), 'fg'))

      vim.keymap.set('n', 'zR', require 'ufo'.openAllFolds)
      vim.keymap.set('n', 'zM', require 'ufo'.closeAllFolds)

      local ufo_setup = {
        provider_selector = function(_, _, _)
          return { 'treesitter', 'indent' }
        end,
      }

      require 'ufo'.setup(ufo_setup)
    end,
  },

  {
    'luukvbaal/statuscol.nvim',
    config = function()
      --[[
      local builtin = require 'statuscol.builtin'
      require 'statuscol'.setup {
        segments = {
          {
            text = { builtin.foldfunc},
            click = 'v:lua.ScFa'
          },
        },
      }
      ]]
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
    -- opts = {
    --   signs = {
    --     add = { text = '│' },
    --     change = { text = '│' },
    --     delete = { text = '_' },
    --     topdelete = { text = '‾' },
    --     changedelete = { text = '~' },
    --     untracked = { text = '┆' },
    --   },
    --
    --   -- CHANGED: BEGIN
    --   -- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    --   signcolumn = true,
    --   -- CHANGED: END
    --
    --   numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
    --   linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    --   word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    --   watch_gitdir = {
    --     interval = 1000,
    --     follow_files = true,
    --   },
    --   attach_to_untracked = true,
    --   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    --   current_line_blame_opts = {
    --     virt_text = true,
    --     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    --     delay = 1000,
    --     ignore_whitespace = false,
    --   },
    --   current_line_blame_formatter =
    --   '<author>, <author_time:%Y-%m-%d> - <summary>',
    --   sign_priority = 6,
    --   update_debounce = 100,
    --   status_formatter = nil,  -- Use default
    --   max_file_length = 40000, -- Disable if file is longer than this (in lines)
    --   preview_config = {
    --     -- Options passed to nvim_open_win
    --     border = 'single',
    --     style = 'minimal',
    --     relative = 'cursor',
    --     row = 0,
    --     col = 1,
    --   },
    --   yadm = {
    --     enable = false,
    --   },
    -- },
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
      require 'tokyonight'.setup {
        on_colors = function(colors)
          colors.border = '#565f89'
        end,
      }
      vim.cmd [[colorscheme tokyonight]]
      vim.cmd [[highlight Comment guifg=#7dcfff]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.opt.showcmdloc = 'statusline'
      require 'lualine'.setup {
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diagnostics' },
          lualine_c = {},
          lualine_x = { 'filetype', 'diff', '%S' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
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

      --[[cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }, -- cmp-buffer
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources { -- 'path' is deleted
          { name = 'cmdline' },        -- cmp-cmdline
        },
      })
      ]]
    end,
  },



  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = picture
      dashboard.section.buttons.val = {
        dashboard.button('n', ' ' .. ' New file',
          ':ene <BAR> startinsert <CR>'),
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
    dependencies = 'nvim-lua/plenary.nvim',
  },
}
-- PLUGINS: END


-- DIAGNOSTICS ICONS: BEGIN
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- DIAGNOSTICS ICONS: END


-- REMEMBER FOLDS: BEGIN
vim.cmd [[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]]
-- REMEMBER FOLDS: END

-- KEYMAPS: BEGIN
local wk = require 'which-key'
local builtin = require 'telescope.builtin'
local noice = require 'noice'
wk.register(
  {
    l = {
      name = '+lsp',
      h = { vim.lsp.buf.hover, 'hover' },
      n = { vim.lsp.buf.rename, 'rename' },
      r = { builtin.lsp_references, 'references' },
      d = { vim.lsp.buf.definition, 'definition' },
      a = { vim.lsp.buf.code_action, 'code action' },
      f = { function()
        vim.lsp.buf.format()
        vim.cmd [[:w]]
      end, 'format entire file' },
      e = { vim.diagnostic.open_float, 'diagnostics' },
    },
    t = {
      name = '+telescope',
      r = { builtin.resume, 'resume' },
      k = { builtin.keymaps, 'keymaps' },
      d = { builtin.diagnostics, 'diagnostics' },
      l = { builtin.live_grep, 'livegrep' },
      f = { builtin.git_files, 'files' },
      s = { builtin.lsp_document_symbols, 'document symbols' },
      w = { builtin.lsp_dynamic_workspace_symbols, 'workspace symbols' },
      b = { builtin.buffers, 'buffers' },
    },
    n = {
      name = '+noice',
      d = { function() noice.cmd 'dismiss' end, 'close messages' },
    },
    z = {
      name = '+folds',
      t = { function() vim.api.nvim_input 'za' end, 'toggle fold' },
    },
  },
  { prefix = '<leader>' }
)

wk.register(
  {
    ['<C-.>'] = {
      function()
        vim.api.nvim_feedkeys('⋅', 'i', true)
      end,
      'dot',
    },
    ['<C-x>'] = {
      function()
        vim.api.nvim_feedkeys('×', 'i', true)
      end,
      'cross product',
    },
    ['<C-l>'] = {
      function()
        vim.api.nvim_feedkeys('λ', 'i', true)
      end,
      'lambda',
    },
    ['<C-r>'] = {
      function()
        vim.api.nvim_feedkeys('∘', 'i', true)
      end,
      'ring operator',
    },
  },
  { mode = 'i' }
)

wk.register(
  {
    l = {
      name = '+lsp',
      f = {
        function()
          vim.lsp.buf.format()
          vim.api.nvim_feedkeys('\x1b', 'v', true)
          vim.cmd [[:w]]
        end,
        'format selection',
      },
    },
  },
  {
    prefix = '<leader>',
    mode = 'v',
  }
)
-- KEYMAPS: END


-- SYNTAX HIGHLIGHTING: BEGIN
require 'nvim-treesitter.configs'.setup {
  modules = { 'query' },
  ignore_install = {},
  auto_install = false,
  ensure_installed = { 'lua', 'c', 'cpp', 'python' },
  sync_install = false,
}
-- SYNTAX HIGHLIGHTING: END


-- COMPLETIONS FOR LSP: BEGIN
local capabilities = require 'cmp_nvim_lsp'.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  'clangd', 'tsserver', 'html', 'tailwindcss', 'emmet_ls', 'pyright',
}

for _, v in pairs(servers) do
  require 'lspconfig'[v].setup { capabilities = capabilities }
end

local on_attach = function(_, _)
  vim.api.nvim_create_autocmd('CursorHold', {
    callback = vim.diagnostic.open_float,
  })
end
-- COMPLETIONS FOR LSP: END

-- MISCALLENOUS: BEGIN
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
          trailing_table_separator = 'smart',
          max_line_length = '80',
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


-- haskell
require 'lspconfig'.hls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- elm
require 'lspconfig'.elmls.setup {
  capabilities = capabilities,
  on_attach = on_attach,

}
-- MISCALLENOUS: END

local old = vim.lsp.util.apply_text_document_edit

vim.lsp.util.apply_text_document_edit =
    function(text_document_edit, index, offset_encoding)
      vim.print 'lolkek'
      old(text_document_edit, index, offset_encoding)
      vim.print(text_document_edit)
    end

local function f0()
  vim.print 'unchanged'
end

F1 = f0

f0 = function()
  vim.print 'changed'
end

F1()
