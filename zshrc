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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#eval `ssh-agent -s`
#ssh-add

ulimit -n 10000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export PATH=./node_modules/.bin:$PATH
export PATH=~/bin:$PATH

#python 2
export PATH=~/Library/Python/2.7/bin:$PATH

# RUBYGEMS="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
# if [[ -d $RUBYGEMS ]]; then
#   PATH="$RUBYGEMS:$PATH"
# fi

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
alias emulator=${ANDROID_HOME}/emulator/emulator


export PATH=$PATH:~/.mongodb/versions/mongodb-current/bin

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

# transfer() {
#     curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
# }

# alias transfer=transfer

export TERM=xterm

export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init - zsh)"

PATH="/Users/bclark/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/bclark/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/bclark/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/bclark/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/bclark/perl5"; export PERL_MM_OPT;
