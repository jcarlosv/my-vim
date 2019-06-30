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

"ntpeters/vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"rust
execute "let g:rustfmt_autosave = 1"
if executable('rls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'rls',
				\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
				\ 'whitelist': ['rust'],
				\ })
	au FileType rust noremap <silent> <C-]> :LspDefinition<CR>
endif
au BufRead,BufNewFile *.rs set filetype=rust
let g:lsp_diagnostics_echo_cursor = 1
imap <c-space> <Plug>(asyncomplete_force_refresh)

" misc
set shortmess+=c
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest
