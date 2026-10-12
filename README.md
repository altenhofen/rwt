# rwt
rwt is a worktree manager written in zsh which provides easy access to git worktrees in a tmux environment


# features:
- configure point  of start for worktree, be it HEAD, origin/develop, origin/master, etc
- create or select an existing worktree in a split, or new pane
- select default agents, pick an agent


# how it works:
inside a tmux session use `rwt` in the shell or a shortcut such as `modifier + n` and create the worktree with your agent


# shell syntax:
## create new worktree from configured base:
```zsh
rwt [--to] feat/context-boundaries -p [--from] HEAD
```
## create new worktree from configured base in a horizontal split from origin/develop:
```zsh
rwt [--to] feat/context-boundaries [--from] origin/develop -hs
```

## create new worktree from configured base in a pane from master and open claude code:
```zsh
rwt feat/context-boundaries master -p -a claude
```
Can also be expanded to:
```
-a|--agent
-hs|--horizontal-split
-vs|--vertical-split
-s|--split
-t|--to
-f|--from
```

See how the order of arguments does not change the program behaviour.


# conf file:
**globally:** $XDG_CONFIG_HOME/rwt/rwt.toml

**per repo:** .rwt.toml

## syntax
```toml
[agents]
which = ["claude", "codex --yolo", "cursor-agent", "opencode"]
auto_open = true
default = "claude"


[worktrees]
from = "origin/develop"

[tmux]
default_split = "vertical" # affects `-s` flag
```


# tmux plugin:
tmux plugin provides a visual creation of worktrees (names) and macros for
creating worktrees in new panes, horizontal/veritcal splits, selecting agents,
etc.
