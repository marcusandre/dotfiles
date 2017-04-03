" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  autocmd VimEnter * PlugInstall --sync | qall
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'garyburd/go-explorer', { 'for': 'go' }
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar', { 'for': 'go' }
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'php']  }
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'

" Colors
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
Plug 'trevordmiller/nova-vim'

call plug#end()

" Setup command line completion
set wildmenu
set wildmode=full

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
set encoding=utf-8

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \   exe "normal! zz" |
  \ endif

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
    silent! autocmd InsertEnter * set nocursorline
    silent! autocmd InsertLeave * set cursorline
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
set nojoinspaces

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
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Quietly update buffers
set autoread

" Write content when calling :make
set autowrite

" Hide abandoned buffers
set hidden

" Enable syntax highlighting
syntax enable

" Enable indentation per file type
filetype plugin indent on

" Setup whitespace for different file types
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au FileType gitcommit setlocal tw=68 colorcolumn=69 spell
au FileType go setlocal nolist noet ts=2 sw=2 sts=2 modifiable
au FileType make setlocal nolist noet ts=4 sw=4 sts=4

" Enable omnicompletion for file types
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" php just makes no sense
au FileType php setlocal ft=html

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Set colorscheme by reference to daytime
let hour = strftime("%H")
if 6 <= hour && hour < 18
  silent! colorscheme lucius
  set background=light
else
  silent! colorscheme nova
  set background=dark
end

" Set leader key
let mapleader = ","

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
nnoremap <leader>W :wall<cr>

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

" Make :W and :Q commands work like :w and :q
cabbr W w
cabbr Q q

" Prevent me from entering Ex mode.
" Format the current paragraph or selection instead.
vmap Q gq
nmap Q gqap

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
nnoremap <leader>tn :call NumberToggle()<CR>

" Fuzzy file and buffer actions
nnoremap <leader>F :Files<CR>
nnoremap <leader>f :Buffers<CR>

" Setup :Bdelete
nnoremap <leader>d :Bdelete<CR>

" Setup GitGutter
" mnemonic: go hunk
nnoremap gh :GitGutterNextHunk<CR>
nnoremap gH :GitGutterPrevHunk<CR>

" Setup ack.vim
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Setup Tagbar
nmap <leader>T :TagbarToggle<CR>

"
" Setup vim-go
"

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
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

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " ,GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
