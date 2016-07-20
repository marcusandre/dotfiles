set nocompatible " Disable backwards compatibility with vi

" Plugins {{{

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

call plug#end()

" }}}
" Settings {{{

colorscheme PaperColor
set autoindent                   " enable auto indentation
set background=light             " easy on the eyes
set breakindent                  " wraps paragraphs like sublime text
set colorcolumn=80               " line at column 80
set cursorline                   " highlight current line
set dir=/tmp                     " directory for tmp files
set expandtab                    " number of spaces to insert a <Tab>
set hidden                       " close modified buffers
set hlsearch                     " Highlight search results
set lazyredraw                   " don't redraw screen while running macros
set nobackup                     " no backup files
set nonumber                     " hide line numbers
set norelativenumber             " do not use relative line numbers
set noswapfile                   " no swap files
set nowrap                       " softwrap lines
set nowritebackup                " no backups before overwriting
set shiftwidth=2                 " number of space characters inserted for indentation
set showcmd                      " Show (partial) command in last line
set showmatch                    " show matching brackets
set smartcase                    " smart case when searching
set smartindent                  " Auto-indent new lines
set tabstop=2                    " number of spaces that a <Tab> in the file counts for
set viminfo='1000,<500,:500,/500 " viminfo settings for remembering information
set wildmenu                     " Enhanced command-line completion

" }}}
" File Types {{{

filetype indent on " Enable file type detection

" }}}
" Listings {{{

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" }}}
" Maps {{{

nnoremap , <nop>
let mapleader="\,"

" change vim behaviour quickly
nnoremap <C-l> :set list!<CR>
nnoremap <C-n> :setlocal nu!<CR>:setlocal rnu!<CR>
nnoremap <C-p> :set invpaste paste?<CR>
nnoremap <C-w> :setlocal wrap!<CR>:setlocal wrap?<CR>

" exit insert mode with jk
imap jk <ESC>

" switch buffers with tab
nnoremap <S-Tab> :bNext<cr>
nnoremap <Tab> :bnext<cr>

"split windows
nnoremap <Bar> <C-W>v<C-W><Right>
nnoremap _ <C-W>s<C-W><Down>

" }}}
" EasyAlign {{{

nmap ga <Plug>(EasyAlign)
vmap <enter> <plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" }}}
