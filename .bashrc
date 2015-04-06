# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export LD_LIBRARY_PATH="/usr/local/lib"
export LD_RUN_PATH="/usr/local/lib"
export LIBDIR="/usr/local/lib"

export PATH=/home/elbunuelo/bin/Sencha/Cmd/4.0.4.84:$PATH

export SENCHA_CMD_3_0_0="/home/elbunuelo/bin/Sencha/Cmd/5.1.2.52"

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

stty -ixon

powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
. /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export PATH=/home/elbunuelo/bin/Sencha/Cmd/5.1.2.52:$PATH
export EDITOR='vim'
source ~/.bin/tmuxinator.bash
