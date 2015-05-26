" vim oder vi
set nocompatible

" basics
set backspace=indent,eol,start
set nobackup
set nowritebackup
set directory=.,$TEMP
set backupdir=.,$TEMP
set noswapfile
set history=100
set ruler
set showcmd
set showmode
set hidden
set laststatus=2
set autowrite
set shell=bash
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=3
set title
set visualbell
set modeline

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular.git'
" Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'NLKNguyen/papercolor-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call vundle#end()

" display
syntax enable
filetype plugin indent on

" indenting
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set breakindent
set autoindent
set wrap linebreak nolist

" whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" lines and rows
set number
set numberwidth=4
set textwidth=80
set colorcolumn=+1

" mvim
set guifont=M+\ 1m:h16

" splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" always jump search results in the middle of the screen
nnoremap n nzz

" set leader key
let mapleader = ","

" mappings
nmap <leader>p :CtrlP<cr>
nmap <leader>s :nohlsearch<cr>

" disable arrow keys
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" bind commands
command! Q q
command! W w
command! WQ wq

" ctrl-p settings
set wildignore+=*/node_modules/*

" vim-go mappings
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" vim-go settings
let g:go_fmt_command = "goimports"

" Use the nearest .git directory as `cwd`
let g:ctrlp_working_path_mode = 'r'

" colorscheme
set t_Co=256
colorscheme PaperColor
