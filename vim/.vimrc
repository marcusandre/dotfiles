set nocompatible " Disable backwards compatibility with vi

" Plugins {{{

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

" }}}
" Settings {{{

set autoindent                   " enable auto indentation
set background=light             " easy on the eyes
set backspace=indent,eol,start   " configure backspacing
set breakindent                  " wraps paragraphs like sublime text
set cm=blowfish2                 " method used for encryption
set colorcolumn=80               " line at column 80
set complete-=i                  " specify how keyword completion works
set cursorline                   " highlight current line
set dir=/tmp                     " directory for tmp files
set expandtab                    " number of spaces to insert a <Tab>
set hidden                       " close modified buffers
set hlsearch                     " Highlight search results
set incsearch                    " show where a pattern, as it was typed so far, matches
set laststatus=2                 " always show the status line
set lazyredraw                   " don't redraw screen while running macros
set nobackup                     " no backup files
set nonumber                     " hide line numbers
set norelativenumber             " do not use relative line numbers
set noswapfile                   " no swap files
set nowrap                       " softwrap lines
set nowritebackup                " no backups before overwriting
set ruler                        " show line and column number of cursor position
set shell=/bin/bash              " configure which shell to use
set shiftwidth=2                 " number of space characters inserted for indentation
set showcmd                      " show (partial) command in last line
set showmatch                    " show matching brackets
set smartcase                    " smart case when searching
set smartindent                  " Auto-indent new lines
set smarttab                     " insert blanks according to <shiftwidth>
set splitbelow splitright        " More natural split opening
set tabstop=2                    " number of spaces that a <Tab> in the file counts for
set title                        " show current file in title bar
set viminfo='1000,<500,:500,/500 " viminfo settings for remembering information
set wildmenu                     " Enhanced command-line completion

" }}}
" File Types {{{

if has('autocmd')
  filetype plugin indent on " Enable file type detection
endif

" }}}
" Syntax & Colour {{{

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

colorscheme Solarized

" }}}
" Maps {{{

nnoremap , <nop>
let mapleader="\,"

" change vim behaviour quickly
nnoremap <C-n> :setlocal nu!<CR>:setlocal rnu!<CR>
nnoremap <C-p> :set invpaste paste?<CR>
nnoremap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" exit insert mode quickly
imap jk <ESC>
imap kj <ESC>

" switch buffers with tab
nnoremap <S-Tab> :bNext<cr>
nnoremap <Tab> :bnext<cr>

" split windows
nnoremap <leader>% <C-W>v
nnoremap <leader>" <C-W>s

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Use <C-L> to clear search highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" }}}
" Commands {{{

command! HTML set filetype=html

" }}}
" Enable omni completion  {{{

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" }}}
" EasyAlign {{{

nmap ga <Plug>(EasyAlign)
vmap <enter> <plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" }}}
