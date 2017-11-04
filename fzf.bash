# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/balac/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/balac/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/balac/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/balac/.fzf/shell/key-bindings.bash"

