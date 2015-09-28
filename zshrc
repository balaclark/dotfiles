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
