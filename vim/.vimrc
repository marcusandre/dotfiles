set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/seoul256.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'
call plug#end()

" Enable wildmenu
set wildmenu

" Don't use swap or backup files
set noswapfile
set nobackup

" Setup lines and numbers
set number
set relativenumber
set ruler

" Setup status and dislpay
set laststatus=2
set display+=lastline

" Set encoding
set encoding=utf-8

" Setup searching
set incsearch
set hlsearch

" Setup whitespace and indents
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

" Setup history and sessions
set history=1000
set sessionoptions-=options

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Enable backspacing over everything in insert mode
set backspace=indent,eol,start

" Natural split handling
set splitright
set splitbelow
set mouse=a

" Setup Update times
set ttimeout
set ttimeoutlen=100
set updatetime=100

" Update changed files
set autoread

" Enable syntax highlighting
syntax enable
filetype plugin indent on

" Setup whitespace for different file types
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au FileType make setlocal noet ts=4 sw=4 sts=4

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Set colorscheme
set background=dark
colorscheme dracula

" Set leader key
let mapleader = "\<Space>"

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Replace with style
nnoremap c* *Ncgn

" Edit file relative to buffer with :ze
cnoremap ze edit <c-r>=expand("%:h")<cr>/

" Stop highlighting search results
nnoremap ,, :nohlsearch<CR>

" Setup vim-go
let g:go_fmt_command = "goimports"
