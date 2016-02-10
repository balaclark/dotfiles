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

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export PATH=~/bin:$PATH

RUBYGEMS="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
if [[ -d $RUBYGEMS ]]; then
  PATH="$RUBYGEMS:$PATH"
fi

export TZ=UTC

# install global npm packages in ~
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export EDITOR=vim
