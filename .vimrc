" basics
filetype off
set nocompatible
set encoding=utf-8

" enable vim-plug
call plug#begin()

" plugins
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'uarun/vim-protobuf'
Plug 'csscomb/vim-csscomb'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'flazz/vim-colorschemes'

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
set nowrap

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
nmap <Leader>s :w<cr>
nmap <Leader>t :NERDTreeToggle<cr>
nmap <Leader>, <C-w>
nmap <Leader>. <C-w><C-w>
nmap <ESC><ESC> :nohlsearch<CR>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" automatically jump to end of pasted text
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

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

" open NERDTree if buffer is empty at startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" colorscheme
colorscheme Tomorrow-Night
let g:airline_theme="tomorrow"
