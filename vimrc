execute pathogen#infect()

set ts=4
set nu
syntax on

let mapleader = ","

nmap <leader>l :set list!<CR>
nmap <leader>h :Helptags<CR>


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
autocmd VimEnter * NERDTree
"let NERDTreeWinPos="right"
let NERDTreeIgnore = ['\.swp$', '.git$[[dir]]', '.o$[[file]]']
map <C-n> :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

filetype on
"filet
autocmd FileType c,cpp set cindent
"au

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
