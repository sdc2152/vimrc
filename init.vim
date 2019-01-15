"- NAVIGATION --
"1.1 TAB MANAGEMENT
"
"-- PLUGINS --
"2.1 NERD TREE
"2.2 ALE
"2.3 LATEX - LIVE PREVIEW
"2.4 VIM NOTES
"2.5 TAGBAR
"2.6 CTRL P
"2.7 EASYTAGS
"2.8 AIRLINE
"2.9 DEOPLETE
"
"-- MODES --
"3.1 INSERT MODE
"3.2 NORMAL MODE
"3.3 VISUAL MODE
"
"-- APPEARANCE --
"4.1 COLORSCHEME
"4.2 SPACING/TABS

execute pathogen#infect()

"set leader key
let g:mapleader = ','

"set mouse scrolling in normal mode (change to = a for all modes)
set mouse=n

"set the tag file
set tags=~/.vimtags

let g:python3_host_prog='/usr/local/bin/python'

"========= NAVIGATION =========
"--------------
" 1.1 TAB MANAGEMENT
"--------------
"set more natural splits
set splitbelow
set splitright
"--------------
" 1.2 BUFFER MANAGEMENT
"--------------
" allow buffers to be in backgrounds while unwritten
set hidden
" switch buffers
noremap H :bp<cr>
noremap L :bn<cr>

"========= PLUGINS =========
"--------------
" 2.1 NERD TREE
"--------------
"let g:NERDTreeWinPos = 'right'
noremap <leader>nn :NERDTreeToggle<cr>
noremap <leader>nb :NERDTreeFromBookmark
noremap <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinSize = 40
"--------------
" 2.2 ALE
"--------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"--------------
" 2.3 LIVE PREVIEW
"--------------
"\ nnoremap <buffer><leader>p :LLPStartPreview<cr>
au BufNewFile,BufRead *.tex setl updatetime=1
let g:livepreview_previewer='open -a Preview'
"--------------
" 2.4 VIM NOTES
" --------------
let g:notes_directories = ['~/Documents/Notes']
"--------------
" 2.5 TAGBAR
" --------------
nmap <leader>tt :TagbarToggle<CR>
let g:tagbar_map_showproto = 'd'
"--------------
" 2.6 CTRL_P
" --------------
"store .cache
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"use ag instead of vims globpath() for faster search
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"--------------
" 2.7 EASYTAGS
" --------------
let g:easytags_async = 1
"--------------
" 2.8 AIRLINE
" --------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':t'
"--------------
" 2.9 DEOPLETE
" --------------
" Use deoplete.
let g:deoplete#enable_at_startup = 1

"========= MODES =========
"--------------
" 3.1 INSERT MODE
"--------------
"easier to press escape key
inoremap jj <esc>

"uppercase
inoremap <leader>U <esc>viwUea
"lowercase
inoremap <leader>u <esc>viwuea

"delete word
inoremap <m-backspace> <c-w>

"--------------
" 3.2 NORMAL MODE
"--------------
"toggle relative line numbers
nnoremap <leader>ll :set relativenumber!<cr>

"have paste match indent
nnoremap p ]p

"visual line navigation
nnoremap j gj
nnoremap k gk

"up and down skip less
nnoremap <c-u> 5gk
nnoremap <c-d> 5gj

"edit .vimrc
nnoremap <leader>erc :e $MYVIMRC<cr>
nnoremap <leader>src :source $MYVIMRC<cr>

"uppercase letters
nnoremap <leader>U viwU
"lowercase
nnoremap <leader>u <esc>viwu

"map backspace to get rid of search highlight
nnoremap <silent> <BS> :nohlsearch<CR>

"substitution
nnoremap <leader>ra :%s//g<LEFT><LEFT>
nnoremap <leader>rr :%s//gc<LEFT><LEFT><LEFT>
nnoremap <leader>rl :s//g<LEFT><LEFT>

"substitution of search highlight
nnoremap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'

"select all
nnoremap <leader>sa ggVG

"remove trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"===================================
" <spaace> commands
"===================================
"Space as kind of second leader
nmap <space> \

"easier window navigation
nnoremap \h <c-w>h
nnoremap \j <c-w>j
nnoremap \k <c-w>k
nnoremap \l <c-w>l

"work on same file in different tabs (:tab split)
nnoremap \ts :tab split<cr>

"easier window creation
nnoremap \v <c-w>v
nnoremap \s <c-w>s
nnoremap \N <c-w>n
nnoremap \n :vnew<cr>

"window close
nnoremap \q <c-w>q
nnoremap \o <c-w>o

"window resize
nnoremap  \+ 999<c-w>+999<c-w>>
nnoremap  \= <c-w>=

"--------------
" 3.3 VISUAL MODE
"--------------
"sort highlighted
xnoremap <leader>s :sort<cr>
xnoremap <leader>S :sort!<cr>
xnoremap <leader>ra :s//g<LEFT><LEFT>
xnoremap <leader>rr :s//gc<LEFT><LEFT><LEFT>

"keep text selected when shifting with > or <
vnoremap < <gv
vnoremap > >gv


"========= APPEARANCE =========
"--------------
" 4.1 COLORSCHEME
"--------------
"python highlighting
let g:python_highlight_all=1

"dark colorscheme
"colorscheme jellybeans
"let g:airline_theme='jellybeans'

"light colorscheme
colorscheme cake16
let g:airline_theme='solarized'

set termguicolors
syntax on

"lazyredraw so faster scrolling
set lazyredraw

"set line numbers
set number

"set cursorline
set cursorline

"set cursor to be in the middle of the screen
set scrolloff=999

"highlight col 80
set colorcolumn=80

"--------------
" 4.2 SPACING/TABS
"--------------
"number of spaces for a tab
set tabstop=4
"number of tab spaces in insert mode
set softtabstop=4
set shiftwidth=4
"insert spaces for a tab
set expandtab

"HTML settings
au BufNewFile,BufRead *.html
            \ setlocal cc=120 ts=2 sts=2 sw=2 filetype=htmldjango
filetype plugin indent on

"C/C++ settings
au BufNewFile,BufRead *.cpp,*.hpp,*.c,*.h
            \ setlocal shiftwidth=3 tabstop=3

"JS settings
au BufNewFile,BufRead *.js,*.jsx
            \ setlocal shiftwidth=2 tabstop=2

" Haskell settings
au BufNewFile,BufRead *.hs
            \ setlocal shiftwidth=2 tabstop=2

"css settings
au BufNewFile,BufRead *.css
            \ setlocal shiftwidth=2 tabstop=2

"use list to show invisible characters
set listchars=tab:>-,space:␣,eol:¬,trail:~,extends:>,precedes:<

" properly joins newlines with comments
set formatoptions+=j
