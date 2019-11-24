bind "set completion-ignore-case on"
#git auto-completion
#source ~/git-completion.bash
PATH=/usr/local/bin:$PATH

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export M2_HOME=/usr/local/apache-maven-3.6.2/
export PATH=$PATH:$M2_HOME/bin

#ssh to my dev machine
alias gg='git grep -n ${1}'
alias ll='ls -Gl'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias vim='/usr/local/bin/vim'
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[32m\]@walmart:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "

#Cassandra
if [ -d "$HOME/opt/cassandra" ]; then
    export PATH="$PATH:$HOME/opt/cassandra/bin"
fi

#Solr
if [ -d "$HOME/opt/solr" ]; then
    export PATH="$PATH:$HOME/opt/solr/bin"
fi
