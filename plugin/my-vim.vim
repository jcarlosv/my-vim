"
" my-vim for Vim
"
" Distributed under terms of the MIT license.
"

if exists("g:my_vim_plugin_loaded")
	finish
endif
let g:my_vim_plugin_loaded = 1

execute "colorscheme delek"
execute "let g:rustfmt_autosave = 1"
execute "autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi"
execute "autocmd BufWritePost *.rs :silent! exec \"!rusty-tags vi --quiet --start-dir=\" . expand('%:p:h') . \"&\" | redraw!"
