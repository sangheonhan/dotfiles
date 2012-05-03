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
if [ -f ~/.dircolors.256dark ]; then
	eval `dircolors ~/.dircolors.256dark`
fi

# Perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi
