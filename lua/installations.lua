local packer = require 'packer'
local use = packer.use

packer.init {
    package_root = Join_paths(vim.fn.stdpath('config'), 'plugins', 'beta'),
}

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

use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
}

use { 'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } } }

use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

use 'lukas-reineke/indent-blankline.nvim'

use { 'numToStr/Comment.nvim',

      config = function() require('Comment').setup() end }
