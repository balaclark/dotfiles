#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word

source "${ZDOTDIR:-$HOME}/.aliases"

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

mkdir $HOME/dev/go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export MYSQL_PATH=/usr/local/Cellar/mysql/5.7.18_1
export PATH=$PATH:$MYSQL_PATH/bin

# basher
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init -)"

export PATH=$PATH:~/.mongodb/versions/mongodb-current/bin

# SSHConfigBase='~/.ssh/config.base'
SSHConfigRepo='~/.ssh/SSHConfiguration/'
SSHConfig='~/.ssh/config'
alias updatesshconfig="cd $SSHConfigRepo && git pull && rm -f ~/.ssh/config && \
  cat $SSHConfigRepo/ssh_config.d/* > $SSHConfig && \
  cat $SSHConfigBase >> $SSHConfig && cd ~\
"

# clock specific workflows (thanks to Ash)

comms-deploy() {
  comms order $1 $2 prepare $3 && comms order $1 $2 install $3
}

copyDatabase() {
  site=$(node -e "console.log(require('./config.json').$SRC.domain.replace('http://', ''))")
  ssh -N -f -M -S /tmp/file-sock -L 27018:127.0.0.1:27017 $site
  DBHOST=localhost:27018 pliers copyDatabase
  ssh -S /tmp/file-sock -O exit $site
}

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

# file sharing via https://transfer.sh/
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

# source /usr/local/etc/bash_completion.d/password-store

mo () {
  mongo $(mongo --quiet --eval 'db.getMongo().getDBNames().join("\n")' | grep -v '^test' | sort | fzf --query=$1 --preview="mongo --quiet --eval 'JSON.stringify(db.stats())' {}")
}

savers-logs-staging () {
  { ssh nuk-savers-production-node-01 'journalctl -o cat -fu node-nuk-savers-staging-*' & ssh nuk-savers-production-node-02 'journalctl -o cat -fu node-nuk-savers-staging-*' & ssh nuk-savers-production-node-03 'journalctl -o cat -fu node-nuk-savers-staging-*' } | bunyan
}
