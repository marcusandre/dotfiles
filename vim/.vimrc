set nocompatible
filetype indent on
syntax on

set autoindent
set backspace=indent,eol,start
set cmdheight=2
set confirm
set expandtab
set hidden
set hlsearch
set incsearch
set laststatus=2
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number
set relativenumber
set pastetoggle=<F11>
set ruler
set shiftwidth=4
set showcmd
set softtabstop=4
set t_vb=
set tabstop=8
set visualbell
set wildmenu

map Y y$

nnoremap <C-L> :nohl<CR><C-L>

augroup makefile
  autocmd!
  autocmd FileType make setlocal nolist noexpandtab ts=4 sw=4 sts=4
augroup end

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72 colorcolumn=+1 colorcolumn+=51
augroup end
