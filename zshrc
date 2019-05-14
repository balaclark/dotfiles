# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word

if [ -e "${ZDOTDIR:-$HOME}/.aliases" ]; then
  source "${ZDOTDIR:-$HOME}/.aliases"
fi

#eval `ssh-agent -s`
#ssh-add

ulimit -n 10000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export PATH=./node_modules/.bin:$PATH
export PATH=~/bin:$PATH

RUBYGEMS="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
if [[ -d $RUBYGEMS ]]; then
  PATH="$RUBYGEMS:$PATH"
fi

#export TZ=UTC

# install global npm packages in ~
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export EDITOR=nvim

# mkdir $HOME/dev/go
# export GOPATH=$HOME/dev/go
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:/usr/local/opt/go/libexec/bin

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/emulator
alias emulator=${ANDROID_HOME}/tools/emulator

export MYSQL_PATH=/usr/local/Cellar/mysql/5.7.18_1
export PATH=$PATH:$MYSQL_PATH/bin

# basher
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init -)"

export PATH=$PATH:~/.mongodb/versions/mongodb-current/bin

alias tgp="yarn test && git push"

# setup terminal tab title
function title {
    if [ "$1" ]
    then
        unset PROMPT_COMMAND
        echo -ne "\033]0;${*}\007"
    else
        export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
    fi
}
title

mo () {
  mongo $(mongo --quiet --eval 'db.getMongo().getDBNames().join("\n")' | grep -v '^test' | sort | fzf --query=$1 --preview="mongo --quiet --eval 'JSON.stringify(db.stats())' {}")
}

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/bclark/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/bclark/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
}

alias transfer=transfer
