# .bashrc

# Title
case "$TERM" in
gnome-*|xterm*|rxvt*)
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
*)
    ;;
esac

#Set ls colors for solarized dark
which dircolors
if [ "$?" -eq "0" ]; then
    dircolors --version | perl -e 'while ( <> ) { if ( /(\d+)\.\d+/ && $1 > 5 ) { exit 1; } } exit 0;'
    if [ "$?" -ne "0" ]; then
	DIRCOLORS_FILE=~/.dircolors.256dark
    else
	DIRCOLORS_FILE=~/.dircolors.256dark.centos5
    fi
fi

# Perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi
