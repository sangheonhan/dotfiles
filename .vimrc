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
set langmenu=none	" 영문 메뉴
language messages ko_KR.utf-8	" 한국어 vim 메시지

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Solarized'
Plugin 'Syntastic'
"Plugin 'AutoTag'
"Plugin 'Indent-Guides'
"Plugin 'SQLComplete.vim'
"Plugin 'Shougo/neocomplete'
"Plugin 'The-NERD-tree'
"Plugin 'ZenCoding.vim'
"Plugin 'ctrlp.vim'
"Plugin 'dbext.vim'
"Plugin 'joonty/vdebug.git'
"Plugin 'matchit.zip'
"Plugin 'minibufexpl.vim'
"Plugin 'neocomplcache'
"Plugin 'netrw.vim'
"Plugin 'snipMate'
"Plugin 'surround.vim'
"Plugin 'taglist.vim'
"Plugin 'vcscommand.vim'
"Plugin 'vim-json-bundle'

" Plugins for PHP
"Bundle 'StanAngeloff/php.vim'
"Bundle 'arnaud-lb/vim-php-namespace'
"Bundle 'checksyntax'
"Bundle 'php.vim'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'stephpy/vim-php-cs-fixer'
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
	set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h18
    elseif has("gui_win32")
	set guifont=Bitstream_Vera_Sans_Mono_for_Po:h12:cHANGEUL
    else
	set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 12
    endif
endif

" 마우스
if has('win32')
    set mouse=n
endif

" Map
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" TagList
let Tlist_Use_Right_Window = 1

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_close_preview = 1

" netcomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Search in all subdirectories.
set path+=**
