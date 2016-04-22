" My vimrc

call pathogen#infect()

set tabstop=2
set shiftwidth=2
set expandtab

if has("autocmd")
    filetype plugin indent on
endif

" Ctags stuff
nnoremap <F12> :!ctags -R<CR>
set tags=./tags;

" remap ; to :...
nnoremap ; :

" Show partial command in status line
set showcmd

" colorscheme for indent-guides
colorscheme default

" F2 for paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Cool menu!
set wildmenu
set wildmode=list:longest,full

" Highlight and incremental search.
" Ctrl N kills the highlights
set hlsearch
set incsearch
nmap <silent> <C-N> :silent noh<CR>

set relativenumber

" Show tabs with double-arrow
set list
set listchars=tab:»·

syn on
set bg=dark
set t_Co=256

set visualbell

" lazyredraw helps with performance sometimes
set lazyredraw

" Trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
" Apply match to all windows:
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

augroup FILES
  au FileType go set noexpandtab
  au FileType go set nolist
augroup END

" Default is go, which does `go build`, which is too slow.
let g:syntastic_go_checkers = ['govet', 'golint']
