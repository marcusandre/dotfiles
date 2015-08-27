" Vim Basics
" ==========

filetype off
set nocompatible
set encoding=utf-8

" Enable vim-plug
" ===============

call plug#begin()

" Plugins
" =======

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
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim'
Plug 'mhinz/vim-startify'
Plug 'NLKNguyen/papercolor-theme'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'

" End vim-plug
" ============

call plug#end()

" Display Settings
" ================

syntax on
syntax enable
set t_Co=256

" Editor Setup
" ============

set autoread                      " Reload files changed outside vim
set backspace=indent,eol,start    " Allow backspace in insert mode
set breakindent                   " Every wrapped line will continue visually indented
set clipboard=unnamed             " Use system clipboard
set cmdheight=1
set complete=.,w,b,u,t,i,kspell
set cursorline
set directory=.,$TEMP
set hidden                        " Buffers can exist in the background
set history=1000                  " Store more command line history
set hlsearch                      " Highlight search by default
set ignorecase
set incsearch                     " Find the next match of current search
set laststatus=2                  " Always show status line
set lazyredraw                    " No redraw while executing makros
set ls=2
set modeline
set number                        " Show line numbers
set numberwidth=4
set relativenumber
set ruler                         " Show the line and column number
set shell=bash
set showcmd                       " Show incomplete cmds down the bottom
set showmatch                     " Briefly jump to the matching
set showmode                      " Show current mode down the bottom
set smartcase
set splitbelow                    " Opens horizontal split below current window
set splitright                    " Opens vertical split right of current window
set textwidth=80
set title
set ttyfast                       " Send more characters

" Indendation Settings
" ====================

filetype indent on
filetype plugin on
set autoindent     " Copy indent from current line
set colorcolumn=+1
set expandtab
set linebreak      " Wrap lines at convenient points
set nowrap         " Don't wrap lines
set shiftwidth=2
set smartindent    " Do smart autoindenting when starting a new line.
set smarttab
set softtabstop=2
set tabstop=2      " Number of spaces that a <Tab> counts for.

" Whitespace settings
" ===================

set list listchars=tab:»·,trail:·,nbsp:·

" Disable Swap Files
" ===================

set nobackup
set noswapfile
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Text Completion
" ===============

set wildmenu                   " Enhanced completion mode
set wildmode=longest,list,full
set wildignore+=*vim/backups*

" Scrolling
" =========

set scrolloff=8
set sidescrolloff=12
set sidescroll=1

" Remap Leader Key
" ================

let mapleader = ","

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Mappings
" ========

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
nmap <silent> H ^
nmap <silent> L $
nmap <silent>- :NERDTreeToggle<cr>
nmap <silent>_ :TagbarToggle<cr>
nmap <space> :nohlsearch<cr>

" Rebind Commands
" ===============

command! Q q
command! W w
command! WQ wq
cmap w!! w !sudo tee %

" Split Navigations
" =================

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Long Lines as Break Lines
" =========================

nnoremap j gj
nnoremap k gk

" Automatically jump to end of pasted text
" ========================================

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Reselect visual block after indent/outdent
" ==========================================

vnoremap < <gv
vnoremap > >gv

" Disable Arrow Keys
" ==================

map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Edtor Events
" ============

" Resize splits on window resize
au VimResized * exe "normal! \<c-w>="

" Realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" Plugins
" =======

" Neocomplete
" ==============
let g:acp_enableAtStartup = 0                           " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 1                 " Use neocomplete
let g:neocomplete#enable_smart_case = 1                 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length

" CTRL-P
" ========
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 5
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'r'

" override ctrlp to use The Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" NERDTree
" ========
let g:NERDTreeWinSize = 30
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

" open NERDTree if buffer is empty at startup
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1
  \ && exists("b:NERDTreeType")
  \ && b:NERDTreeType == "primary") | q | endif

" Vim-Go
" ======
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
let g:go_fmt_command = "gofmt"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" CSScomb
" =======
autocmd FileType css noremap <buffer> <leader>co :CSScomb<cr>
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass,*.styl silent! :CSScomb<cr>

" Markdown
" ========
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" Editorconfig
" ============
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" GitGutter
" =========
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0
highlight Comment cterm=italic

" Airline
" =======
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

" Colorscheme
" ===========
let g:hybrid_use_Xresources = 1
set background=light
silent! colorscheme PaperColor
