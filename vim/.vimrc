set nocompatible

call plug#begin('~/.vim/plugged')

" Plugins
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'docker/docker' , { 'rtp': 'contrib/syntax/vim/' }
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/emmet-vim', { 'for': 'html'  }
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'jonathanfilip/vim-lucius'

call plug#end()

" Setup command line completion
set wildmenu
set wildmode=longest:full,full

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

" Move the cursor to the previous matching bracket
" for a short amount of time (defaults to 5 normally)
set showmatch
set matchtime=3

" Improve redrawing
set ttyfast

" Setup status and dislpay
set laststatus=2
set display+=lastline

" Use UTF-8 by default
if has('multi_byte')
  set encoding=utf-8
endif

" Set format
set fileformat=unix

" Setup searching
set hlsearch
set ignorecase
set incsearch
set smartcase

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
set expandtab
set smarttab
set autoindent
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Setup history and sessions
set history=1500
set sessionoptions-=options

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Enable backspacing over everything in insert mode
set backspace=indent,eol,start

" More natural splits
set splitright
set splitbelow
set mouse=a

" Improve scroll visibility
if !&scrolloff
  set scrolloff=8
endif
if !&sidescrolloff
  set sidescrolloff=10
endif

" Setup update times
set ttimeout
set ttimeoutlen=100
set updatetime=100

" Quietly update buffers
set autoread

" Enable syntax highlighting
syntax enable

" Enable indentation per file type
filetype plugin indent on

" Setup whitespace for different file types
au BufNewFile,BufRead *.go setlocal nolist noet ts=4 sw=4 sts=4
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au FileType make setlocal nolist noet ts=4 sw=4 sts=4
au FileType gitcommit setlocal tw=68 colorcolumn=69 spell

" Enable omnicompletion for file types
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Set colorscheme
silent! colorscheme lucius
set background=light

" Set leader key
let mapleader = ","

" Hide abandoned buffers
set hidden

" Easier split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Improve movement for wrapped lines
nnoremap j gj
nnoremap k gk

" Replace with style
nnoremap c* *Ncgn

" Quick <Esc>
imap jj <Esc>
imap jk <Esc>

" Quick writes
nnoremap <leader>w :write<cr>

" Quick /
nnoremap <Space> /

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Cycle through quickfix
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" Cycle through jump list as normal but
" show the position in middle of window
nnoremap <C-o> <C-o>zvzz

" Make :W and :Q lork like :w and :q
cabbr W w
cabbr Q q

" Prevent me from entering Ex mode.
" Format the current paragraph or selection instead.
vmap Q gq
nmap Q gqap

" Stop highlighting search results
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Quickly change background setting
map <Leader>bg :let &background = (background == "dark"? "light" : "dark")<CR>

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

" Setup :Bdelete
nnoremap <leader>d :Bdelete<CR>

" Setup GitGutter
" mnemonic: go hunk
nnoremap gh :GitGutterNextHunk<CR>
nnoremap gH :GitGutterPrevHunk<CR>
nnoremap <leader>gt :GitGutterLineHighlightsToggle<CR>

" Setup ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

" Setup ack.vim
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Setup vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
