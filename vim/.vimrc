" vim ft=vim ts=2
"
" ----------------------------------------------------------------------------
" Settings
" ----------------------------------------------------------------------------

set nocompatible

" Indentation
set autoindent
set smartindent
set expandtab
set nosmarttab
filetype plugin on

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" ctags
set tags=./tags;/

" Command line
set wildmenu
set wildmode=full

" More natural splits
set splitright
set splitbelow
set mouse=a

" Misc
set autoread
set autowrite
set backspace=indent,eol,start
set complete-=i
set encoding=utf-8
set hidden
set lazyredraw
set nojoinspaces
set nostartofline
set nowrap
set number relativenumber
set scrolloff=5
set showmode
set virtualedit=block
set visualbell t_vb=

" ----------------------------------------------------------------------------
" Backups
" ----------------------------------------------------------------------------

set backup
set backupcopy=yes
set backupdir=$HOME/.vim/backup
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.
set swapfile
set writebackup

if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p")
endif

if !isdirectory($HOME . "/.vim/spell")
  call mkdir($HOME . "/.vim/spell", "p")
endif

if !isdirectory($HOME . "/.vim/swap")
  call mkdir($HOME . "/.vim/swap", "p")
endif

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \   exe "normal! zz" |
  \ endif

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

let mapleader = ','

inoremap <C-s> <C-O>:write<cr>
nnoremap <leader>W :wall<cr>
nnoremap <leader>w :write<cr>

nnoremap <space> /

nnoremap Q @q
nnoremap Y y$

nnoremap c* *Ncgn

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>
nnoremap <leader>c :cclose<cr>

nnoremap gs mzvip:sort u<cr>'z

nnoremap <tab> :bnext<cr>
nnoremap <S-tab> :bprevious<cr>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <silent> <C-l> :nohlsearch<cr><C-l>

nnoremap n nzz
nnoremap } }zz

" ----------------------------------------------------------------------------
" vim-plug
" ----------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Fuzzing
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'php']  }
Plug 'mattn/sonictemplate-vim'

" Navigating
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale', { 'on': 'ALEEnable' }

" Languages
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

" Syntax
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }

" Misc
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-dispatch'

" Colors
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'

call plug#end()

" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------

syntax enable
silent! colorscheme dracula
set background=dark

" ----------------------------------------------------------------------------
" GitGutter
" ----------------------------------------------------------------------------

nnoremap gh :GitGutterNextHunk<cr>
nnoremap gH :GitGutterPrevHunk<cr>

" ----------------------------------------------------------------------------
" Tagbar
" ----------------------------------------------------------------------------

nmap <leader>T :TagbarToggle<cr>

" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------

nnoremap <leader>F :Files<cr>
nnoremap <leader>f :Buffers<cr>

" ----------------------------------------------------------------------------
" Ack
" ----------------------------------------------------------------------------

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" ----------------------------------------------------------------------------
" vim-go
" ----------------------------------------------------------------------------

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<cr>
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" Call :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" ----------------------------------------------------------------------------
" Filetypes
" ----------------------------------------------------------------------------

augroup manual
autocmd!
au Filetype * setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup end

augroup golang
autocmd!
au FileType go setlocal nolist noexpandtab ts=2 sw=2 sts=2 modifiable
augroup end

augroup makefile
autocmd!
au FileType make setlocal nolist noet ts=4 sw=4 sts=4
augroup end

augroup gitcommit
autocmd!
au FileType gitcommit setlocal tw=68 colorcolumn=69 spell
augroup end

augroup markdown
autocmd!
au FileType markdown setlocal spell
augroup end

augroup vagrantfile
autocmd!
au BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
augroup end

augroup help
autocmd!
au FileType help setlocal nospell
augroup end
