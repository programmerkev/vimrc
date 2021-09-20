call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

let mapleader = "\<Space>"
set nocompatible
set viminfo='1000,f1,:1000,/1000
set history=1000
syntax on
set number
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"
set colorcolumn=81

" Display whitespaces
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set list

" New splits open to right and bottom
set splitbelow
set splitright

set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent
set expandtab
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" <Leader>v = Paste
map <Leader>v "+gP

" <Leader>c = Copy
map <Leader>c "+y

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" Prevent Ex Mode
nnoremap Q <nop>


"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_

"------  Window Navigation  ------
" <Leader>hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :Bclose!<CR>


" <Leader>O orders selected rows by length
vmap <Leader>o  :! awk '{ print length(), $0 <bar> "sort -n <bar> cut -d\\  -f2-" }'<CR>


"------  Searching  ------
set incsearch
set ignorecase
set smartcase

" <Leader>f = enable search highlighting and find next match
nmap <Leader>f :set hlsearch<CR>n

" <Leader>b = turn search highlighting back off
nnoremap <silent> <leader>b :set nohlsearch<CR>

let g:ackprg="ack -H --nocolor --nogroup --column"

"----CtrlP Settings----
" <Leader>r to view recent files
nmap <Leader>r :CtrlPMRUFiles<CR>

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

" CtrlP won't show results from node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|storage|coverage|target|dist|public)|(\.(swp|ico|git|svn))$'


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using <Leader>n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" Focus on NERDTree using <Leader>m
noremap <silent> <Leader>m :NERDTreeFocus<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

" Close NERDTree after opening a file
let NERDTreeQuitOnOpen=1



"------  Vuejs Filetype Settings ------
au BufNewFile,BufRead *.vue set filetype=html

"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  CoffeeScript Filetype Settings  ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  JSX Filetype Settings ------
autocmd! BufEnter *.jsx let b:syntastic_checkers=['eslint']
autocmd! BufEnter *.js let b:syntastic_checkers=['eslint']


"------  EJS Filetype Settings  ------
au BufNewFile,BufRead *.ejs set filetype=html

"------  Vuejs Filetype Settings ------
au BufNewFile,BufRead *.vue set filetype=html

"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  CoffeeScript Filetype Settings  ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  JSX Filetype Settings ------
autocmd! BufEnter *.jsx let b:syntastic_checkers=['eslint']
autocmd! BufEnter *.js let b:syntastic_checkers=['eslint']


"------  EJS Filetype Settings  ------
au BufNewFile,BufRead *.ejs set filetype=html

"------ Airline Settings ------
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '











"------  GUI Options  ------
if has("gui_running")

else
        set t_Co=256
        colorscheme Mustang
        set mouse=a
endif
