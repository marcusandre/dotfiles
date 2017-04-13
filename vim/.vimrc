set nocompatible
filetype off

" }}}
" ============================================================================
" VIM-PLUG {{{
" ============================================================================

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
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }

" Misc
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-dispatch'

" Colors
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'

call plug#end()

" }}}
" ============================================================================
" Settings
" ============================================================================

filetype plugin on

let mapleader = ' '

" Indentation
set autoindent
set expandtab smarttab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" Temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

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

" }}}
" ============================================================================
" Filetypes
" ============================================================================

au BufNewFile,BufRead Vagrantfile set filetype=ruby
au FileType gitcommit setlocal tw=68 colorcolumn=69 spell
au FileType make setlocal nolist noet ts=4 sw=4 sts=4

" }}}
" ============================================================================
" Colors
" ============================================================================

syntax enable
silent! colorscheme lucius
set background=dark

" }}}
" ============================================================================
" Buffers
" ============================================================================

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \   exe "normal! zz" |
  \ endif

" }}}
" ============================================================================
" Mappings
" ============================================================================

cnoremap jk <C-c>
inoremap jk <Esc>
xnoremap jk <Esc>

inoremap <C-s> <C-O>:update<cr>
nnoremap <leader>W :wall<cr>
nnoremap <leader>w :update<cr>

nnoremap Q @q
nnoremap Y y$

nnoremap c* *Ncgn

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

nnoremap gs vip:sort u<cr>

nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" }}}
" ============================================================================
" GitGutter
" ============================================================================

nnoremap gh :GitGutterNextHunk<CR>
nnoremap gH :GitGutterPrevHunk<CR>

" }}}
" ============================================================================
" Tagbar
" ============================================================================

nmap <leader>T :TagbarToggle<CR>

" }}}
" ============================================================================
" fzf
" ============================================================================

nnoremap <leader>F :Files<CR>
nnoremap <leader>f :Buffers<CR>

" }}}
" ============================================================================
" Ack
" ============================================================================

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" }}}
" ============================================================================
" vim-go
" ============================================================================

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
  autocmd BufNewFile,BufRead *.go setlocal nolist noexpandtab ts=2 sw=2 sts=2 modifiable
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
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
