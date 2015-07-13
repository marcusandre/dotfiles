" basics
filetype off
set nocompatible
set encoding=utf-8

" enable vim-plug
call plug#begin()

" plugins
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'uarun/vim-protobuf'
Plug 'csscomb/vim-csscomb'
Plug 'fatih/vim-go'
Plug 'NLKNguyen/papercolor-theme'
Plug 'flazz/vim-colorschemes'
" Plug 'Valloric/YouCompleteMe'

" end vim-plug
call plug#end()

" display
syntax enable
filetype plugin indent on

" settings
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set ruler
set hidden
" set number
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
set listchars=tab:»·,trail:·,nbsp:·

" set leader key
let mapleader = ","

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" mappings
nmap <leader>o :CtrlP<cr>
nmap <leader>p :set invpaste paste?<cr>
nmap <leader>s :nohlsearch<cr>
nmap <Leader>w :w<CR>
nmap <Leader>, <C-w>
nmap <Leader>. <C-w><C-w>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
cmap w!! w !sudo tee %

" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" use the nearest .git directory as `cwd`
let g:ctrlp_working_path_mode = 'r'

" override to use The Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" vim-go settings and mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" insert import paths automatically + fmt
let g:go_fmt_command = "goimports"

" csscomb
autocmd FileType css noremap <buffer> <leader>co :CSScomb<CR>
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb<CR>

" colorscheme
colorscheme PaperColor
let g:airline_theme="papercolor"
