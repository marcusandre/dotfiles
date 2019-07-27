" vim ft=vim ts=2
set nocompatible

" == vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

Plug 'dracula/vim'
Plug 'nightsense/snow'

call plug#end()

" == Settings

set autoread
set backspace=indent,eol,start
set complete-=i
set hidden
set nowrap
set showcmd
set ttimeout
set ttimeoutlen=100

" numbers
set number
set numberwidth=2
set relativenumber
set splitbelow splitright

" statusline
set laststatus=2
set modelines=2
set showcmd
set synmaxcol=1000
set wildmenu
set display=truncate

" white space
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" search
set hlsearch incsearch
set ignorecase smartcase

" file type detection
filetype plugin indent on

" swap files
set backupdir=/tmp//,.
set directory=/tmp//,.
set undodir=/tmp//,.

" Remember last location in file
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
endif

" Enable using the mouse if available.
if has('mouse')
  set mouse=a
endif


" == Syntax

syntax on
set t_Co=256

let g:dracula_colorterm = 0
set background=dark
colorscheme dracula

" == statusline
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" == Mappings

" Set leader key
let mapleader = ","

" Disable Ex-Mode
nnoremap Q gq

" Change word and jump to next occurrence
nnoremap c* *Ncgn

" Clear current line (like S<esc>)
nnoremap X 0D

" Enhanced indenting
vnoremap < <gv
vnoremap > >gv

" Buffer navigation
nnoremap <tab> :bnext<cr>
nnoremap <S-tab> :bprevious<cr>
nnoremap <leader>d :bp\|bd #<cr>

" Clear search highlights
nnoremap <silent> <C-l> :nohlsearch<cr><C-l>

" Save files
nnoremap <leader>W :wall<cr>
nnoremap <leader>w :write<cr>

" Quickfix list
nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>
nnoremap <leader>c :cclose<cr>

" == Plugins

" FZF
nnoremap <leader>F :Files<cr>
nnoremap <leader>f :Buffers<cr>

nnoremap <leader>G :GFiles?<cr>
nnoremap <leader>g :GFiles<cr>

" GitGutter
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" Rg
nnoremap <leader>a :Rg<Space>

" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" ale
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'html': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\}

" == Filetypes
augroup all
  autocmd!
  autocmd Filetype * setlocal sw=2 sts=2 ts=2
augroup end

augroup golang
  autocmd!
  autocmd FileType go setlocal nolist noexpandtab ts=4 sw=4 sts=4 modifiable
augroup end

augroup makefile
  autocmd!
  autocmd FileType make setlocal nolist noexpandtab ts=4 sw=4 sts=4
augroup end

augroup jsx
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal tw=68 colorcolumn=69 spell
augroup end

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal spell
augroup end
