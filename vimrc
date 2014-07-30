" Boot and configure plugins
call pathogen#infect()
Helptags

filetype plugin indent on
autocmd BufNewFile,BufRead *.json set filetype=javascript

" Basic editor configuration
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set backspace=indent,eol,start
set shiftround
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set hlsearch

set clipboard=unnamedplus

" Key bindings
map <M-Left> <C-T>
map <M-Right> g<C-]>

nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>

" Folding
set foldenable                                   " enable folding
set foldmarker={,}                               " Fold C Style code
set foldmethod=marker                            " Fold on the marker
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set foldlevel=1

if exists("SimpleFoldText")
    "function SimpleFoldText()
    "return getline(v:foldstart).' '
    "endfunction
endif

set foldtext=SimpleFoldText() " Custom fold function (cleaner than default)

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_lis=1
let g:syntastic_enable_signs=1

" Debugger configuration
nmap <Leader>b <ESC>:Breakpoint
let g:debuggerMaxDepth = 3

" PHPUnit
nmap ,t :!phpunit -c app/ %<CR>
nmap ,y :!phpunit %<CR>

" Highlight current variable
nmap <Leader>h :call AutoHighlightToggle()<cr>

" CtrlP - a file finder
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'

" Symfony2 functions
function! Namespace()
    return substitute(substitute(expand("%:h"), '\v^\w+\/(\u)', '\1', ''), '\/', '\\\\', 'g')
endfunction

function! Bundle()
    return substitute(Namespace(), '\v^(.*)\\Bundle\\(.*)\\.*', '\1\2', '')
endfunction

" Autocompletion
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
