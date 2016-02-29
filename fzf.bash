# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/bala/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/bala/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/bala/.fzf/man* && -d "/Users/bala/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/bala/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/bala/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/bala/.fzf/shell/key-bindings.bash"

