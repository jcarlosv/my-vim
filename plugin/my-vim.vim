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

" misc
set shortmess+=c
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest

" Template name
let g:email = 'vmjcarlos@gmail.com'
let g:username= 'Carlos Venegas'

" Show file all the time
set laststatus=2

" Golang
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

" C/C++
if executable('clangd')
    set nu
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"rust
execute "let g:rustfmt_autosave = 1"
if executable('rls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'rls',
				\ 'cmd': {server_info->['rls']},
				\ 'whitelist': ['rust'],
				\ })
	au FileType rust noremap <silent> <C-]> :LspDefinition<CR>
endif
au BufRead,BufNewFile *.rs set filetype=rust
let g:lsp_diagnostics_echo_cursor = 1
imap <c-space> <Plug>(asyncomplete_force_refresh)

"sh
let g:shfmt_fmt_on_save = 1

"fzf
nnoremap <C-p> :Files<Cr>

" no esc
inoremap jk <Esc>
imap <Esc> <Nop>
