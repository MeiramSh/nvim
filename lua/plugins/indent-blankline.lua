vim.opt.list = true
vim.opt.listchars:append('space:·')
require('indent_blankline').setup {
    buftype_exclude = { 'terminal', 'prompt', 'nofile', 'help' },
    filetype_exclude = { 'packer', 'lspinfo' },
}
