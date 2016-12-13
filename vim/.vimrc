set nocompatible

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/seoul256.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'
call plug#end()

" Enable wildmenu
set wildmenu
set wildmode=longest:list

" Don't use swap or backup files
set noswapfile
set nobackup

" Setup line numbers
set number
set relativenumber

" Show current position in the status bar
set ruler

" Show the keystrokes being entered in the screen
set showcmd

" Show the current mode if not normal mode
set showmode

" Improve redrawing
set ttyfast

" Setup status and dislpay
set laststatus=2
set display+=lastline

" Use UTF-8 by default
if has('multi_byte')
  set encoding=utf-8
endif

" Setup searching
set incsearch
set hlsearch

" Clear search highlighting for insert mode
" Restore when leaving insert mode
if has('autocmd')
  augroup highlight
    autocmd!
    silent! autocmd InsertEnter * set nohlsearch
    silent! autocmd InsertLeave * set hlsearch
  augroup END
endif

" Setup whitespace and indents
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set shiftround

" Setup history and sessions
set history=1500
set sessionoptions-=options

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Enable backspacing over everything in insert mode
set backspace=indent,eol,start

" Natural split handling
set splitright
set splitbelow
set mouse=a

" tmux mouse handling
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" Improve scroll visibility
if !&scrolloff
  set scrolloff=8
endif
if !&sidescrolloff
  set sidescrolloff=10
endif

" Setup Update times
set ttimeout
set ttimeoutlen=100
set updatetime=100

" Quietly update buffers
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
silent! colorscheme base16-tomorrow-night

" Set leader key
let mapleader = ","

" Hide abandoned buffers
set hidden

" Easier split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Replace with style
nnoremap c* *Ncgn

" Quick :w
nnoremap ZW :w!<CR>
nnoremap ZA :wa!<CR>

" Quick <Esc>
imap jj <Esc>

" Quick /
nnoremap <Space> /

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Keep split - close buffer
nnoremap <leader>d :b#<bar>bd#<CR>

" Quick fix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" Edit file relative to buffer with :ze
cnoremap ze edit <c-r>=expand("%:h")<CR>/

" Stop highlighting search results
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Toggle between normal and relative numbering.
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>nt :call NumberToggle()<CR>

" Fuzzy file and buffer actions
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Setup NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
map <C-p> :NERDTreeToggle<CR>

" Setup GitGutter
" mnemonic: go hunk
nnoremap gh :GitGutterNextHunk<CR>
nnoremap gH :GitGutterPrevHunk<CR>

" Setup vim-go
let g:go_fmt_command = "goimports"
