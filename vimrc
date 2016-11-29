set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
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

nmap <leader>l :set list!<CR>
nmap <leader>h :Helptags<CR>
nmap <leader>w :x<CR>
nmap <leader>q :q!<CR>

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
