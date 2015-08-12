execute pathogen#infect()

set ts=4
set nu
set history=700
set encoding=utf8
set ruler
"set background=dark

" Set to auto read when a file is changed from the outside
set autoread

" Use spaces instead of tabs
set expandtab
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

syntax on

let mapleader = ","
let g:mapleader = ","

nmap <leader>l :set list!<CR>
nmap <leader>h :Helptags<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code


let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

"在vim启动时默认开启NERDTree
"autocmd VimEnter * NERDTree
"let NERDTreeWinPos="right"
let NERDTreeIgnore = ['\.swp$', '.git$[[dir]]', '\.o$[[file]]', '.sublime-project[[file]]', '.sublime-workspace[[file]]']
map <C-n> :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeFind<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YCM/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"Fugitive

filetype plugin on
filetype plugin indent on
"filet
autocmd FileType c,cpp set cindent
"autocmd FileType php noremap <C-B> :w!<CR>:!/usr/bin/php %<CR>
"au

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup reload_vimrc " {
"    autocmd!
"    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }
