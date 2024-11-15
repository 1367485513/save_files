# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

##shopt -s checkwinsize
### make less more friendly for non-text input files, see lesspipe(1)
##  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### set variable identifying the chroot you work in (used in the prompt below)
##if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
##    debian_chroot=$(cat /etc/debian_chroot)
##fi

### set a fancy prompt (non-color, unless we know we "want" color)
##case "$TERM" in
##    xterm-color) color_prompt=yes;;
##esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

# Get repo info
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;91m\]\u\[\033[01;37m\] at \[\033[01;33m\]\h\[\033[01;37m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " \[\033[01;32m\][%s]")\[\033[00m\]\$ '
    #PS2="> "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cd1='cd ..;ls'
alias cd2='cd ../..;ls'
alias cd3='cd ../../..;ls'
alias cd4='cd ../../../..;ls'
alias cds3='cd /data200/majiahao/S3/LLVM;ls'
alias cdll='cd /data200/majiahao/llvm-project;ls'
# alias cdb2='cd /data200/majiahao/b2_0810;ls'
# alias cdxoc='cd /data200/majiahao/xoc;ls'
alias act='conda activate py36'
alias deact='conda deactivate'

#/home/majiahao/miniconda3/bin
#PATH=/home/majiahao/miniconda3/bin:$PATH


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/majiahao/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/majiahao/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/majiahao/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/majiahao/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
