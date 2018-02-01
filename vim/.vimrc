" vim ft=vim ts=2
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'AndrewRadev/splitjoin.vim'
Plug 'blinry/vimboy'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'for': 'go', 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'SirVer/ultisnips', { 'for': 'go' }

Plug 'arcticicestudio/nord-vim'
Plug 'fatih/molokai'
Plug 'flazz/vim-colorschemes'
Plug 'owickstrom/vim-colors-paramount'
Plug 'robertmeta/nofrils'

call plug#end()

" == Common settings

set hidden
set ruler
set encoding=utf-8
set history=2000
set mouse=a
set autoread
set backspace=indent,eol,start
set splitbelow splitright
set guioptions=
set nowrap

" Enable line numbers
" INFO: keep disabled for now, because performance matters more
" set number numberwidth=2 relativenumber

" Define statusline infos
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set showcmd

" Define white space settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Define search settings
set hlsearch incsearch
set ignorecase smartcase

" Override modeline settings
set modeline
set modelines=10

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=.git,vendor/*,node_modules

" Enable file type detection
filetype off
filetype plugin indent on

" Define swap files location
set backupdir=~/.vim/backup,/tmp/
set directory=~/.vim/backup,/tmp

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" == Syntax
syntax on
set t_Co=256
set background=light
colorscheme Tomorrow

" == Mappings

" Set leader key
let mapleader = ","

" Disable Ex-Mode
nnoremap Q <nop>

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

" Add TODO comment
nnoremap t iTODO: <esc>:Commentary<cr>==A
nnoremap T iTODO(mgs): <esc>:Commentary<cr>==A

" Save files
nnoremap <leader>W :wall<cr>
nnoremap <leader>w :write<cr>

" Quickfix list
nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>
nnoremap <leader>c :cclose<cr>

" Toggle wrap
nnoremap <leader>r :set wrap!<cr>

" insert lambda λ
imap <C-l> <C-k>l*

" FZF
nnoremap <leader>F :Files<cr>
nnoremap <leader>f :Buffers<cr>

nnoremap <leader>G :GFiles?<cr>
nnoremap <leader>g :GFiles<cr>

" EasyMotion
nmap Q <Plug>(easymotion-prefix)s
nmap <leader><leader> <Plug>(easymotion-prefix)

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" GitGutter
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" Rg
nnoremap <leader>a :Rg<Space>

" == Plugins

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" Filetypes
augroup manual
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

augroup vagrantfile
  autocmd!
  autocmd BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
augroup end
