set nocompatible " Disable backwards compatibility with vi

" plugins {{{

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
" settings {{{

colorscheme Tomorrow-Night-Eighties
set autoindent                   " enable auto indentation
set background=dark              " easy on the eyes
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
" file types {{{

filetype indent on " Enable file type detection

" }}}
" listings {{{

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" }}}
" commands {{{


" }}}
" maps {{{

nnoremap , <nop>
let mapleader="\,"

nmap <leader>W :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l :set list!<CR>
nmap <leader>n :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p :set invpaste paste?<CR>
nmap <leader>w :write<CR>

" fzf
nmap <c-b> :Buffers<CR>
nmap <c-p> :Files .<CR>

" exit insert mode with jk
imap jk <ESC>

" start/end of lines
nmap H ^
nmap L $

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
