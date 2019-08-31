" My vimrc

if !has("packages")
  runtime pack/public/opt/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect("pack/public/start/{}")
  execute pathogen#helptags()
endif

set tabstop=2
set shiftwidth=2
set expandtab

" Allow backspaces past start of insert
" NOTE: Some systems already turn this on by default (check /etc/vimrc)
" However, some do not, so let's explicitly turn it on for those that don't.
set backspace=indent,eol,start

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

set number
set relativenumber

" F3: no numbers -> absolute -> relative + absolute
nnoremap <F3> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>

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

let g:ruby_indent_assignment_style = 'variable'
