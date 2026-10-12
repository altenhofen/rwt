#!/usr/bin/env bash
# tmux plugin entry: opens the interactive rwt prompt in a popup.
# Set `set -g @rwt-key 'w'` before loading the plugin to change the key (default: n).
dir=$(cd "$(dirname "$0")" && pwd)
key=$(tmux show-option -gqv @rwt-key)
tmux bind-key "${key:-n}" display-popup -E -w 80% -h 60% "\"$dir/bin/rwt\" --interactive"
