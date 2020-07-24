# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# EXPORT ENVIRONMENT VARIABLES
 

# Homebrew Coreutils
if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
    PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export PATH
fi
if [ -d /usr/local/opt/coreutils/libexec/gnuman ]; then
    MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    export MANPATH
fi

# Composer
if [ -d $HOME/.composer/vendor/bin ]; then
    PATH=$PATH:$HOME/.composer/vendor/bin
    export PATH
fi

# Make vim the default editor
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make less the default pager
export PAGER="less"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Make some commands not show up in history
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"

# Solarized colorscheme for OS X `ls` environment variable:
if [[ "$OSTYPE" == (darwin|freebsd)* ]]; then
    unset LSCOLORS # Conflict with Oh My Zsh Theme
    export CLICOLOR=1
    export CLICOLOR_FORCE=1
fi


# FUNCTIONS


function mkrandfile() {
    dd if=/dev/urandom of=$1 bs=1048576 count=$2
}

function randkey() {
    php -r '$seed = array_merge(range("1", "9"), range("a", "z"), range("A", "Z")); shuffle($seed); $length = (isset($argv[1])) ? intval($argv[1]) : 32; $seed_size = count($seed); $randkey = ""; for ($i = 0; $i < $length; $i++) { $randkey .= $seed[rand(0, $seed_size - 1)]; }; echo "$randkey\n";' $@
}

function unixtime() {
    date --date="@$1"
}


# ALIASES


# List all files colorized in long format
alias l="ls -l"

# List all files colorized in long format, including dot files
alias la="ls -la"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
DIRCOLORS_PATH=`which dircolors`
if [ -x $DIRCOLORS_PATH ]; then
    test -r ~/.dircolors-solarized/dircolors.256dark && eval "$(dircolors -b ~/.dircolors-solarized/dircolors.256dark)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="ls -G"
    fi
fi

# IP addresses
alias ipconfig="/sbin/ifconfig -a | perl -nle 'chomp(\$1), print \$1 if /(\d+\.\d+\.\d+\.\d+)/;'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Check public IP
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

# Use Vim instead of vi
alias vi=vim

# Vim viewer
alias v=view


# READ EXTRA CONFUGRATION


[ -f ~/.extra ] && source ~/.extra
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
