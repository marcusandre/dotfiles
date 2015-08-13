" basics
filetype off
set nocompatible
set encoding=utf-8

" enable vim-plug
call plug#begin()

" plugins
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'csscomb/vim-csscomb'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kien/ctrlp.vim'
Plug 'marijnh/tern_for_vim'
" Plug 'mhinz/vim-startify'
Plug 'NLKNguyen/papercolor-theme'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'

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
set breakindent
set ruler
set hidden
set numberwidth=4
set textwidth=80
set colorcolumn=+1
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set relativenumber
set number
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
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
set lazyredraw

" whitespace
set list
set listchars=tab:»·,trail:·,nbsp:·

" set leader key
let mapleader = ","

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" mappings
nmap - :NERDTreeToggle<cr>
nmap <ESC><ESC> :nohlsearch<cr>
nmap <leader>, <C-w>
nmap <leader>. <C-w><C-w>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>ev :edit $MYVIMRC<CR>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>p :set invpaste paste?<cr>
nmap <leader>s :w<cr>
nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>w :set invwrap wrap?<CR>
nmap <silent> <Leader><space> :CtrlP<cr>
nmap <silent> <Leader>b<space> :CtrlPBuffer<cr>
nmap <silent> <leader>r :redraw!<cr>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

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

" jump to start or end of line
nmap H ^
nmap L $

" override ctrlp to use The Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" use the nearest .git directory as `cwd`
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden = 1

" open NERDTree if buffer is empty at startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeWinSize=40

" enable omnicompletion at stratup
let g:neocomplete#enable_at_startup = 1

" vim-go settings and mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" insert import paths automatically + fmt
let g:go_fmt_command = "goimports"

" csscomb
autocmd FileType css noremap <buffer> <leader>co :CSScomb<cr>
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass,*.styl silent! :CSScomb<cr>

" markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" colorscheme
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme PaperColor
