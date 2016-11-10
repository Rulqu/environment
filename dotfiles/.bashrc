# .bashrc

test -f ~/.git-completion.bash && . $_

# User specific aliases and functions
export FIGNORE=CVS
export CVSROOT=
export CVSEDITOR=vim
alias vi='vim'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
export TERM=xterm-256color
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parent_command=$(ps -o comm= -p $PPID)
parent_command=${parent_command##*/}
if [ "$(ps -o tty= -p $$)" = "$(ps -o tty= -p $PPID)" ]; then
    # Not running directly under a terminal emulator
    PS1="{$parent_command}$PS1"
fi

. /etc/default/epages6
# generated by epages6-cli installer
export EPAGES_CLI=$EPAGES/epages6-cli
chmod a+x $EPAGES_CLI/ep6-*
export PATH=$EPAGES_CLI:$PATH
# end
