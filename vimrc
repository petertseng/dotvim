" My vimrc
" 2012-05-03

call pathogen#infect()

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Ctags stuff
nnoremap <F12> :!ctags -R<CR>
set tags=./tags;

" remap ; to :...
nnoremap ; :

" Show partial command in status line
set showcmd

" line and column markers
set cursorline
set cursorcolumn

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

" Trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup FILES
    au FileType make   set noexpandtab shiftwidth=8
    au FileType lisp   set shiftwidth=2 tabstop=2
    au FileType scheme set shiftwidth=2 tabstop=2
    au FileType ruby   set shiftwidth=2 tabstop=2
    au FileType ocaml  set shiftwidth=2 tabstop=2
" NO smartindent, you don't get to indent my # lines!
    au FileType python inoremap # X#
augroup END
