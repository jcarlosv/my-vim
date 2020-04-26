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

" Templates
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/.dotfiles/templates/=template=.sh
	augroup END
endif

" Show file all the time
set laststatus=2

" Coc
nmap <silent> <C-]> <Plug>(coc-definition)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-go', 'coc-sh', 'coc-snippets', 'https://github.com/polypus74/trusty_rusty_snippets']

"Rust
au BufRead,BufNewFile *.rs set filetype=rust

"sh
let g:shfmt_fmt_on_save = 1

"fzf
nnoremap <C-p> :Files<Cr>

" no esc
inoremap jk <Esc>

augroup twig_ft
	  au!
	    autocmd BufNewFile,BufRead *.gdb   set syntax=gdb
augroup END
