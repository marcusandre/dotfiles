" basics
filetype off
set nocompatible
set encoding=utf-8

" enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-markdown'
Plugin 'godlygeek/tabular.git'
Plugin 'tpope/vim-surround'
Plugin 'rust-lang/rust.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'flazz/vim-colorschemes'
Plugin 'luochen1990/indent-detector.vim'

call vundle#end()

" display
syntax enable
filetype plugin indent on

" settings
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set ruler
set hidden
"  set number
set numberwidth=4
set textwidth=80
set colorcolumn=+1
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set relativenumber
set ls=2
set cursorline
set nowrap
set backspace=indent,eol,start
set wildmenu
set ttyfast
set showmode
set showcmd
set cmdheight=1
set nobackup
set nowritebackup
set directory=.,$TEMP
set backupdir=.,$TEMP
set noswapfile
set history=100
set shell=bash
set scrolloff=3
set title
set visualbell
set modeline
set noundofile

" whitespace
set list
set list listchars=tab:»·,trail:·,nbsp:·

" set leader key
let mapleader = ","

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" mappings
nmap <leader>p :CtrlP<cr>
nmap <leader>s :nohlsearch<cr>
nmap <Leader>w :w<CR>

" automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

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
cmap wf w !sudo tee %

" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" Use the nearest .git directory as `cwd`
let g:ctrlp_working_path_mode = 'r'

" colorscheme
set t_Co=256
colorscheme zenburn
