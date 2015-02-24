" vim oder vi
set nocompatible

" basics
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set shell=bash

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'christoomey/vim-run-interactive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin 'rizzatti/dash.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'

" display
syntax on
filetype plugin indent on

" indenting
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" lines and rows
set textwidth=80
set colorcolumn=+1
set number
set numberwidth=5

" splits
set splitbelow
set splitright
