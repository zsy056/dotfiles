if [ -e $HOME/.rvm/scripts/rvm ]; then
    source $HOME/.rvm/scripts/rvm
    export PATH=$PATH:$HOME/.rvm/bin
fi

hash rbenv &>/dev/null && eval "$(rbenv init -)"

