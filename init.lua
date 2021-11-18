cmd = vim.api.nvim_command
join_paths = require 'packer.util'.join_paths

cmd ('set packpath+='..join_paths(vim.fn.stdpath('config'), 'plugins', 'packer'))
cmd ('highlight MatchParen ctermfg=7 ctermbg=0')

-- packer
local packer = require 'packer'
local use = packer.use

packer.init({
	package_root = join_paths(vim.fn.stdpath('config'), 'plugins'),	
})

use 'wbthomason/packer.nvim'
use 'windwp/nvim-autopairs'

-- autopairs
require('nvim-autopairs').setup{}
