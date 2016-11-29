set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'spf13/vim-autoclose'
Plugin 'scrooloose/syntastic'
Plugin 'tmux-plugins/tpm'
Plugin 'mattn/emmet-vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'tpope/vim-obsession'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'keith/swift.vim'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'powerline/powerline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'honza/vim-snippets'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'thisivan/vim-taglist'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
call vundle#end()

filetype plugin on
filetype plugin indent on

set nu " 设置行号
set encoding=utf8 "设置字符集"
set mouse=a "鼠标"


" rust
"开启rust的自动reformat的功能
let g:rustfmt_autosave = 1
" 手动补全和定义跳转
set hidden
" 这一行指的是你编译出来的racer所在的路径
let g:racer_cmd = "/usr/local/rust/racer/racer/target/release/racer"
" 这里填写的就是我们在1.2.1中让你记住的目录
let $RUST_SRC_PATH="/usr/local/rust/src/rust/src"
"
syntax on
set t_Co=256
color molokai
"set background=dark
"hi Normal  ctermfg=none ctermbg=256
set autoread
set expandtab
set smarttab
set nowrap "取消换行
set ruler " 显示光标行列信息 
set showmatch " 设置匹配模式，括号匹配 

" 设置取消备份 禁止临时文件生成  
set nobackup
" 高亮当前行
set cursorline
" 智能补全命令行
set wildmenu
" 不使用代码折叠功能
set nofoldenable
" 不使用 swapfile
set noswapfile

"80 字符限制
set colorcolumn=120
"你可以使用 Vim 的另一个选项 textwidth，让它在超过 80 个字符的时候自动换行，方法如下:
"set textwidth=80
"这些设置是对于英文设定的，如果你需要使中文也能如此，你需要加入如下的配置：
"set fo+=mB



"统一缩进为4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=2
set textwidth=79

set showcmd            " 命令行显示输入的命令
set showmode        " 命令行显示vim当前模式
set incsearch        " 输入字符串就显示匹配点
set hlsearch
"选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set ignorecase        " 搜索模式里忽略大小写
set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase'

let mapleader =","
let g:mapleader =","
let g:jsx_pragma_required = 0
let g:jsx_ext_required = 0
" https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

nmap <leader>l :set list!<CR>
nmap <leader>h :Helptags<CR>
nmap <leader>w :x<CR>
nmap <leader>q :q!<CR>
"空格进入命令行
noremap <space> :
"C-[kj] 而没有 C-[hl] 因为 C-k 在输入模式下原本绑定为输入一些特殊的字符，而 C-j 原本是插入新行。这两个功能我用的不是多，前者使用本身就少，后者可以用 A-o 和 Enter 来实现。
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"使用 C-j 切换到下一条命令，使用 C-k 切换到上一条命令。使用 C-a 切换到命令行首，C-e 切换到命令行尾就像普通的 shell 一样
"cnoremap <C-j> <t_kd>
"cnoremap <C-k> <t_ku>
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"超级用户权限编辑
cmap sw w !sudo tee >/dev/null %

"在 Vim 中我比较常用的做法是先输入小写字符然后通过 gUw 按键转换成大小字符。个人觉得 Vim 的大小写切换功能的快捷键绑定的不是特别直观。它使用 gu 表示转换成小写，gU 表示转换成大写；这和一般的 u 表示大写 l 表示小写比起来直观性上相差较远且更不容易操作（gUw 其实要按四个按键）。我把大小写切换功能的快捷键做了重新绑定。
nnoremap gu gU
nnoremap gl gu

"搜索
set ic
"set hlsearch
"nmap <leader> :set hlsearch!<CR>

 " Ctags
nmap <leader>cj :tjump<CR>
noremap <Leader>sc :ccl <bar> lcl<CR>
noremap <Leader>se :Errors<CR>
"python
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_cache = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

"PHP namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>ns <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>ns :call PhpSortUse()<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

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


"Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

"let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='dark'

"在vim启动时默认开启NERDTree
"NERDTreeToggle
autocmd VimEnter * NERDTree
"let NERDTreeWinPos="right"
let NERDTreeIgnore = ['\.swp$', '.git$[[dir]]', '\.o$[[file]]', '.sublime-project[[file]]', '.sublime-workspace[[file]]', 'tags','.idea[[dir]]']
map <leader>n :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" taglist
map <leader>tl :TlistToggle<CR>
map <leader>to :TlistOpen<CR>
map <leader>tc :TlistClose<CR>

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

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>jd :CtrlPTag<cr><C-\>w

"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
