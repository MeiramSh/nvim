local alpha = Require 'alpha'
local dashboard = Require 'alpha.themes.dashboard'
-- Set header
dashboard.section.header.val = {
    '                                                     ',
    '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
    '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
    '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    '                                                     ',
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('f', '  > Find file', ':lua Find.files()<cr>'),
    dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
    dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h <CR>'),
    dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return Require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           Requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() Require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = Require("alpha.fortune")
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
Cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

