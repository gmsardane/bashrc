export HISTSIZE=9000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups

history() {
  _bash_history_sync
  builtin history "$@"
}

_bash_history_sync() {
  builtin history -a          # Write to history file
  HISTFILESIZE=$HISTFILESIZE  # Truncate history file
  builtin history -c          # Clear session history
  builtin history -r          # Reload session history
}

PROMPT_COMMAND="_bash_history_sync ; $PROMPT_COMMAND"