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
set scrolloff=5
set title
set visualbell

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
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call vundle#end()

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

" disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" colorscheme
set t_Co=256
color Tomorrow-Night
