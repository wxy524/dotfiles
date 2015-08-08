bind "set completion-ignore-case on"
#git auto-completion
#source ~/git-completion.bash
PATH=/usr/local/bin:$PATH

#ssh to my dev machine
alias dev='ssh -A qiqi'
alias gg='git grep -n ${1}'
alias ll='ls -Gl'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


export PS1="\[\033[36m\]\u\[\033[m\]\[\033[32m\]@yelp:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
