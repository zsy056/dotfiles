" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" as dependence
" github
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-repeat'
"Bundle 'mirell/vim-matchit'
Bundle 'scrooloose/nerdtree'
" vim.org
Bundle 'taglist.vim'

" bundles
" github
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'glts/vim-spacebox'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Twinside/vim-syntax-haskell-cabal'
Bundle 'slim-template/vim-slim.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'quark-zju/vim-cpp-auto-include'
Bundle 'wesleyche/SrcExpl'
Bundle 'wesleyche/Trinity'
"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'ervandew/supertab'
Bundle 'Townk/vim-autoclose'
Bundle 'Yggdroot/indentLine'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'

" vim.org
Bundle 'Cpp11-Syntax-Support'
Bundle 'css_color.vim'
Bundle 'indentpython.vim'
Bundle 'iptables'
Bundle 'jade.vim'
Bundle 'nginx.vim'
Bundle 'PKGBUILD'
Bundle 'python.vim'
Bundle 'renamer.vim'
Bundle 'ShowMarks7'

" not used
" lucius author frequently changes design, not using its latest version
" Bundle 'Lucius'
" use meld GUI tool instead
" Bundle 'sjl/threesome.vim'
" not elegent if status line is visibile, no solution yet
" Bundle 'TabBar'
" works well but too slow
" Bundle 'colorsupport.vim'

filetype plugin indent on
" }}}

" Base Configuration {{{
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/ftplugin/man.vim
" }}}


" Basic UI {{{
syntax on
set showmode
set showcmd
set number
set ttyfast 
set lazyredraw
set ruler
set title
set noea
set wildmenu
set nomousehide
"set lines=48
set columns=83
set updatetime=500
" }}}

" Tab, Spaces, Indent {{{
set expandtab
set smarttab
set autoindent 
set tabstop=4 
set shiftwidth=4 
set backspace=indent,eol,start
set nolinebreak
set wrap
set textwidth=79
set formatoptions=tcqrnl
" per language settings
autocmd FileType ruby setlocal sw=2
" }}}

" Colors {{{
" highlight the column after textwidth column
set colorcolumn=+1
autocmd FileType man setlocal colorcolumn=
autocmd FileType help setlocal colorcolumn=
" show cursor line/column in active window
function! ShowCursorCross(visible)
    if a:visible == 0
        setlocal nocursorcolumn
        setlocal nocursorline
    else
        setlocal cursorcolumn
        setlocal cursorline
    endif
endfunction
function! HighlightCursorCross(level)
    if a:level == 0
        hi CursorColumn guibg=#333
        hi CursorLine   guibg=#333
    else
        hi CursorColumn guibg=#223f44
        hi CursorLine   guibg=#223f44
    endif
endfunction
call ShowCursorCross(1)
call HighlightCursorCross(0)
" for gvim
if has("gui_running")
    set guioptions=egit
    " " if non-bitmap font is preferable
    set guifont=YaHei\ Consolas\ Hybrid\ 10
    "set guifont=Terminus\ 9
    au WinEnter * call ShowCursorCross(1)
    au WinLeave * call ShowCursorCross(0)
    au InsertEnter * call HighlightCursorCross(1)
    au InsertLeave * call HighlightCursorCross(0)
    set lines=60
else
    set t_Co=256
endif
colo mylucius
" no syntax for large files
au BufReadPost * if getfsize(bufname("%")) > 512*1024 |
\ set syntax= |
\ set nowrap |
\ endif
" }}}

" Status line  {{{
" always show status line
set laststatus=2
" (deprecated, use vim-powerline instead)"
" " change statusline color when inserting
" augroup ft_statuslinecolor
"     au InsertEnter * hi StatusLine guifg=#2e3436 guibg=#8ae234
"     au InsertLeave * hi StatusLine guifg=#eee guibg=#444
"
" augroup END
" 
" " path, modified, readonly, preview, help, list
" set statusline=%f%m%r%w%h%q
" 
" " right align, show  file type, encoding, file format, line, col
" set statusline+=%=%{&ft}\ \ 
" set statusline+=%{strlen(&fenc)?&fenc:&enc},%{&ff}\ \ 
" set statusline+=%l\/%L\ \ %03c
" }}}

" Encoding, BOM {{{
set fileencodings=utf-8,ucs-bom,gb18030,big5,shift-jis,default
set fileencoding=utf-8
set encoding=utf-8
set nobomb
" }}}

" Searching, Scrolling, Movement {{{
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set scrolloff=4
set virtualedit=block,insert
" }}}

" Swapping, Undos, Backups, Clipboard, Encrypt {{{
silent !mkdir /var/tmp/vim /tmp/vim > /dev/null 2>&1
set undofile
" set /tmp as swap dir and undodir
set dir=/var/tmp/vim,/tmp/vim,/tmp
set undodir=/var/tmp/vim,/tmp/vim,/tmp
set backupdir=/var/tmp/vim,/tmp/vim,/tmp
" disable annoying backup file, thus no need to set backupdir
set nobackup
" Use X Window clipboard as default clipboard (VimTip21)
set clipboard=unnamedplus,unnamed,autoselect
set cm=blowfish
" }}}

" Folding {{{
" fold level
set foldlevel=4
set foldmethod=marker
" by filetype
autocmd FileType c,cpp,ruby setlocal foldmethod=syntax
autocmd FileType java,javascript setlocal foldmarker={,}
" }}}

" Custom commands {{{
" sudo write
cmap w!! w !sudo tee % >/dev/null
" }}}

" Shortcut keys {{{
" <Leader>
let mapleader=","
" buffer switch using Alt+j,k
nmap <A-j> :bprev<CR>
nmap <A-k> :bnext<CR>
" clear matches
noremap <Leader><Space> :noh<CR>
" override D = d$
nnoremap D d$
" override H = ^, L = g_ (skip spaces)
noremap H ^
noremap L g_
" useful when a line is wrapped
nnoremap j gj
nnoremap k gk
" K use :man
nnoremap K :Man <cword><CR>
" c-a, c-e style home, end
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" <Space> calls SpaceBox
nnoremap <Space> :SpaceBox<CR>
" zO recursively open all folds
nnoremap zO zCzO
" srcexpl, nerdtree, taglist toggle
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :NERDTree<CR>
" ctrlp
nmap <unique> <silent> <Leader>b :CtrlPBuffer<CR>
nmap <unique> <silent> <Leader>m :CtrlPMRU<CR>
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>
" }}}


" Plugin Settings {{{
" ShowMarks
let g:showmarks_enable=0
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^<>[]{}()\""

" Syntastic
let g:syntastic_cpp_compiler_options='-Wall -std=c++11'
let g:syntastic_c_compiler_options='-Wall -std=c11'

" vim-srcexpl
let g:SrcExpl_pluginList=[
        \ "__Tag_List__",
        \ "NERD_tree",
        \ "NERD_tree_1",
        \ "NERD_tree_2",
        \ "Source_Explorer"
    \ ]
let g:SrcExpl_searchLocalDef=1
let g:SrcExpl_isUpdateTags=0
let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey="<F12>" 

" ctags
set tags=./tags;/

" c++ 11 support
au BufNewFile,BufRead *.cpp set syntax=cpp11

" vim-easymotion
let g:EasyMotion_leader_key=';' 

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories=["snippets_basic", "snippets"]

" ctrlp
let g:ctrlp_map='<leader>t'
let g:ctrlp_match_window_reversed=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_dotfiles=0
let g:ctrlp_max_depth=5
let g:ctrlp_custom_ignore={
            \ 'dir':  '\.git$\|\.hg$\|\.svn$\|tmp$',
            \ 'file': '\.so$\|\.o$\|\.out$\|\.lock$',
            \ }
let g:ctrlp_max_files=400

" Neocomplcache
" Use neocomplcache
"let g:neocomplcache_enable_at_startup=1
" Use smartcase
"let g:neocomplcache_enable_smart_case=1
" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
"  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"" command-t (supressed by ctrlp)
" let g:CommandTMaxCachedDirectories=16
" let g:CommandTScanDotDirectories=0
" let g:CommandTMaxFiles=1024
" let g:CommandTMaxDepth=4

"" Molly (supressed by ctrlp)
" nmap <unique> <silent> <Leader>t :Molly<CR>

" air line
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.space = "\ua0"

" indentline
let g:indentLine_char = '┆'

" let me complete
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
" }}}

