# .bashrc

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.bashrc
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Title
case "$TERM" in
gnome-*|xterm*|rxvt*)
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
*)
    ;;
esac

#Set ls colors for solarized dark
which dircolors &> /dev/null
if [ "$?" -eq "0" ]; then
    dircolors --version | perl -e 'while ( <> ) { if ( /(\d+)\.\d+/ && $1 > 5 ) { exit 1; } } exit 0;'
    if [ "$?" -ne "0" ]; then
	DIRCOLORS_FILE=~/.dircolors.256dark
    else
	DIRCOLORS_FILE=~/.dircolors.256dark.centos5
    fi
    if [ -f $DIRCOLORS_FILE ]; then
	eval `dircolors $DIRCOLORS_FILE`
    fi
fi

# Perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi
