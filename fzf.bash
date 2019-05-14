# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/bclark/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/bclark/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/bclark/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/bclark/.fzf/shell/key-bindings.bash"
