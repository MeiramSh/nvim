let g:neovide_remember_window_size = v:true
highlight MatchParen ctermfg=4 ctermbg=0
highlight Comment ctermfg=8
"set guifont=NotoSansMono-Regular-Nerd-Font-Complete
command! Format execute 'lua vim.lsp.buf.formatting_sync()'
autocmd BufWritePre *.lua Format
autocmd BufRead,BufNewFile *.hs setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.scm set filetype=scheme
