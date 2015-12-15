# .bash_profile

#  ~/.extra, ~/.exports, ~/.aliases, ~/.functions 설정 파일을 순차적으로 읽는다
# ~/.extra 파일은 커밋하지 않은 설정을 저장하는데 사용한다
for file in ~/.{extra,exports,aliases,functions,paths}; do
    [ -r "$file" ] && source "$file"
done
unset file

# 글로빙에 대소문자를 구별하지 않는다
shopt -s nocaseglob

# 히스토리를 히스토리 파일에 추가하도록 한다
shopt -s histappend

# cd 명령 사용시 오타를 자동 수정하도록 한다
shopt -s cdspell

# Perlbrew
if [ -f ~/.perl5/etc/bashrc ]; then
	source ~/.perl5/etc/bashrc
fi

# PHPBrew
if [ -f ~/.phpbrew/bashrc ]; then
	source ~/.phpbrew/bashrc
fi

# 비상호작용 쉘이면 더 이상 진행하지 않는다
if [ -z "$PS1" ]; then
    return
fi

# Bash 프롬프트를 설정한다
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

# 터미널 타이틀을 설정한다
case "$TERM" in
gnome-*|xterm*|rxvt*)
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
*)
    ;;
esac

# 명령 실행시마다 히스토리를 다시 읽도록 한다
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# solarized dark 테마에 맞도록 ls 색상을 설정한다
dircolors 2>/dev/null 1>&2
if [ "$?" -eq "0" ]; then
    dircolors --version | perl -e 'while ( <> ) { if ( /(\d+)\.\d+/ && $1 > 5 ) { exit 1; } } exit 0;'
    if [ "$?" -ne "0" ]; then
	DIRCOLORS_FILE=~/.dircolors.256dark
    else
	DIRCOLORS_FILE=~/.dircolors.256dark.centos5
    fi
    if [ -f $DIRCOLORS_FILE ]; then
	eval `dircolors -b $DIRCOLORS_FILE`
    fi
fi
