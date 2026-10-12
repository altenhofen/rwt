#!/usr/bin/env bash
# Links bin/rwt into $PREFIX/bin (default ~/.local/bin). Re-running it is safe.
set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
bin_dir=${PREFIX:-$HOME/.local}/bin

for tool in zsh git tmux; do
  command -v "$tool" >/dev/null 2>&1 || echo "warning: $tool not found on PATH" >&2
done

mkdir -p "$bin_dir"
ln -sfn "$repo_dir/bin/rwt" "$bin_dir/rwt"
echo "linked $bin_dir/rwt -> $repo_dir/bin/rwt"

case ":$PATH:" in
  *":$bin_dir:"*) ;;
  *) echo "warning: $bin_dir is not on PATH" >&2 ;;
esac

echo "to enable the tmux plugin, add this line to ~/.tmux.conf and run 'tmux source ~/.tmux.conf':"
echo "  run-shell $repo_dir/rwt.tmux"
