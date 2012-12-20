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
Bundle 'SQLComplete.vim'
Bundle 'Solarized'
Bundle 'The-NERD-tree'
Bundle 'ZenCoding.vim'
Bundle 'checksyntax'
Bundle 'matchit.zip'
Bundle 'minibufexpl.vim'
Bundle 'php.vim'
Bundle 'phpfolding.vim'
Bundle 'snippetsEmu'
Bundle 'surround.vim'
Bundle 'taglist.vim'
Bundle 'vcscommand.vim'
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
  set guifont=DejaVu\ Sans\ Mono\ 12
endif

" Win32 GUI에서 실행할 경우
if has("gui_win32")
	set guifont=Bitstream_Vera_Sans_Mono:h12:cHANGEUL
endif
