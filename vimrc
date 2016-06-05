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

call vundle#end()

filetype plugin on
filetype plugin indent on
set ts=4
set nu
set history=700
set encoding=utf8
set ruler
"set t_Co=256
"color molokai
"set background=dark

" Set to auto read when a file is changed from the outside
set autoread

" Use spaces instead of tabs
set expandtab
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps

syntax on

let mapleader = ","
let g:mapleader = ","

nmap <leader>l :set list!<CR>
nmap <leader>h :Helptags<CR>
nmap <leader>w :x<CR>
nmap <leader>q :q!<CR>

" Ctags
nmap <leader>cj :tjump<CR>

noremap <Leader>sc :ccl <bar> lcl<CR>
noremap <Leader>se :Errors<CR>

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_cache = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Close popup and save indent
inoremap <slient> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#force_omni_input_patterns')
      let g:neocomplete#sources#omni#force_omni_input_patterns = {}
endif
let g:neocomplete#sources#omni#force_omni_input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <c-n>     s_<Plug>(neosnippet_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"tmux
let g:tmux_navigator_save_on_switch = 1

"emmet
let g:user_emmet_mode='a' "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css,blade,htmldjango,javascript EmmetInstall

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
"autocmd VimEnter * NERDTree
"let NERDTreeWinPos="right"
let NERDTreeIgnore = ['\.swp$', '.git$[[dir]]', '\.o$[[file]]', '.sublime-project[[file]]', '.sublime-workspace[[file]]', 'tags']
map <leader>n :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>jd :CtrlPTag<cr><C-\>w

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

filetype plugin on
autocmd FileType c,cpp set cindent
"autocmd FileType php noremap <C-B> :w!<CR>:!/usr/bin/php %<CR>
"au

if has("autocmd")
    " remove trailing white spaces
    autocmd BufWritePre * :%s/\s\+$//e
endif

" netrwhist
let g:netrw_dirhistmax = 0

map <c-f><c-n> :call JsBeautify()<cr>

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup reload_vimrc " {
"    autocmd!
"    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
