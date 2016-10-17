set nocompatible " Disable backwards compatibility with vi

" Plugins {{{

call plug#begin()

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'trevordmiller/nova-vim'

if has('mac')
  Plug 'rizzatti/dash.vim'
endif

call plug#end()

" }}}
" Settings {{{

set autoindent                   " indent according to previous line
set backspace=indent,eol,start   " configure backspacing
set breakindent                  " wraps paragraphs like sublime text
set cm=blowfish2                 " method used for encryption
set colorcolumn=80               " line at column 80
set complete-=i                  " specify how keyword completion works
set cursorline                   " highlight current line
set dir=/tmp                     " directory for tmp files
set display=lastline             " show as much as possible of the last line
set expandtab                    " use spaces instead of tabs
set hidden                       " switch between buffers without saving
set hlsearch                     " Highlight search results
set incsearch                    " show where a pattern, as it was typed so far, matches
set laststatus=2                 " always show the status line
set lazyredraw                   " don't redraw screen while running macros
set mouse=a                      " enable mouse support
set nobackup                     " no backup files
set nonumber                     " show line numbers
set norelativenumber             " use relative line numbers
set noswapfile                   " no swap files
set nowrap                       " softwrap lines
set nowritebackup                " no backups before overwriting
set path+=**                     " search down into subfolders
set ruler                        " show line and column number of cursor position
set shell=/bin/bash              " configure which shell to use
set shiftwidth=2                 " number of space characters inserted for indentation
set showcmd                      " show (partial) command in last line
set showmatch                    " show matching brackets
set smartcase                    " smart case when searching
set smartindent                  " Auto-indent new lines
set smarttab                     " insert blanks according to <shiftwidth>
set splitbelow                   " open new windows below the current window
set splitright                   " open new windows right of the current window
set tabstop=2                    " number of spaces that a <Tab> in the file counts for
set title                        " show current file in title bar
set ttyfast                      " faster redrawing
set viminfo='1000,<500,:500,/500 " viminfo settings for remembering information
set wildmenu                     " Enhanced command-line completion

" }}}
" File Types {{{

if has('autocmd')
  filetype plugin indent on " Enable file type detection
endif

" CSS
autocmd BufEnter *.css set nocindent
autocmd BufLeave *.css set cindent
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.styl set ft=styl.css

" }}}
" Syntax & Colour {{{

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set background=light
colorscheme lucius

" }}}
" Maps {{{

nnoremap , <nop>
let mapleader="\,"

" change vim behaviour quickly
nnoremap <C-n> :setlocal nu!<CR>:setlocal rnu!<CR>
nnoremap <C-p> :set invpaste paste?<CR>
nnoremap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" exit insert mode quickly
imap <leader><leader> <ESC>

" close buffer but keep split intact
nnoremap <leader>d :bp\|bd #<CR>

" switch buffers with tab
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

" split windows
nnoremap <leader>% <C-W>v
nnoremap <leader>" <C-W>s

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" git commands
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gstatus<CR>

" Use <C-L> to clear search highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" }}}
" Commands {{{

command! FTH set filetype=html

" }}}
" Enable omni completion  {{{

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" }}}
" FZF {{{

nnoremap <leader>m :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" }}}
" EasyAlign {{{

nmap ga <Plug>(EasyAlign)
vmap <enter> <plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" }}}
