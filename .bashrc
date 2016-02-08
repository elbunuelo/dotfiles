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

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

stty -ixon

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export EDITOR='vim'

PERL_MB_OPT="--install_base \"/home/elbunuelo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/elbunuelo/perl5"; export PERL_MM_OPT;

_tmux_environment () {
    local last_exit_code=$?;
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")';
    return $last_exit_code
}
export PROMPT_COMMAND=$PROMPT_COMMAND$'\n'$'_tmux_environment'
