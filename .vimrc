""" ========================================================
""" 기본적인 설정들
""" ========================================================
set autoindent		" 자동 들여쓰기
set autowrite		" :next 나 :make 같은 명령를 입력하면 자동으로 저장
set background=dark	" 백그라우드 색상
set backspace=2		" 삽입 모드에서 백스페이스를 계속 허용
set cindent		" C 언어 자동 들여쓰기
set encoding=utf-8	" 에디터 인코딩을 UTF-8로 설정
set fileencodings=utf-8,euc-kr	" 파일인코딩을 UTF-8로 설정
set foldmethod=marker	" 폴딩 방식
set ignorecase		" 찾기에서 대/소문자를 구별하지 않음
set incsearch		" 점진적으로 찾기
set nocompatible	" Vim 디폴트 기능들을 사용함
set nojoinspaces	" J 명령어로 줄을 붙일 때 마침표 뒤에 한칸만 띔
set novisualbell	" 비주얼벨 기능을 사용하지 않음
set nowrapscan		" 찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음
set ruler		" 상태표시줄에 커서 위치를 보여줌
set shiftwidth=4	" 자동 들여쓰기 간격
set showcmd		" (부분적인) 명령어를 상태라인에 보여줌
set showmatch		" 매치되는 괄호의 반대쪽을 보여줌
set smartindent		" 역시 자동 들여쓰기
set title		" 타이틀바에 현재 편집중인 파일을 표시
set number		" 행 번호를 표시
set hlsearch		" 찾는 단어를 하이라이팅

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Indent-Guides'
Bundle 'Solarized'
Bundle 'The-NERD-tree'
Bundle 'minibufexpl.vim'
Bundle 'snipMate'
Bundle 'taglist.vim'
Bundle 'joonty/vdebug.git'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'surround.vim'
Bundle 'SQLComplete.vim'
Bundle 'vcscommand.vim'
Bundle 'dbext.vim'
Bundle 'netrw.vim'
Bundle 'neocomplcache'
" Plugins for PHP
Bundle 'php.vim'
Bundle 'checksyntax'
Bundle 'shawncplus/phpcomplete.vim'
filetype plugin indent on
" Fix 'SSL certificate problem'
let $GIT_SSL_NO_VERIFY = 'true'

" Set color theme
let g:solarized_termcolors=16
colorscheme solarized

" 문법 강조기능 사용
if has("syntax")
    syntax on
endif

" GUI 모드로 실행할 경우
if has("gui_running")
    set visualbell	" 비주얼벨 기능 사용
    if has("gui_macvim")
	set guifont=Bitstream\ Vera\ Sans\ Mono:h14
    elseif has("gui_win32")
	set guifont=Bitstream_Vera_Sans_Mono:h12:cHANGEUL
    else
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    endif
endif

" 마우스
"set mouse=n

" Map
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>

" TagList
let Tlist_Use_Right_Window = 1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
