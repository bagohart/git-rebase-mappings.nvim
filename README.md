# git-rebase-mappings.nvim
Neovim plugin that adds some simple mappings to make git-rebase more fun.
All mappings are dot-repeatable, and do not require [vim-repeat](https://github.com/tpope/vim-repeat).

## Mappings
No default mappings, create them explicitly:
```lua
vim.keymap.set('n', '<LocalLeader>a', '<Plug>(git-rebase-mappings-abbreviate)')
vim.keymap.set('n', '<LocalLeader>A', '<Plug>(git-rebase-mappings-expand)')
require('git-rebase-mappings').create_commit_command_mappings()
```

The function `create_commit_command_mappings(prefix)` creates the following mappings:
- `<LocalLeader>p`, `<LocalLeader>P` (pick)
- `<LocalLeader>r`, `<LocalLeader>R` (reword)
- `<LocalLeader>e`, `<LocalLeader>E` (edit)
- `<LocalLeader>s`, `<LocalLeader>S` (squash)
- `<LocalLeader>f`, `<LocalLeader>F` (fixup)
- `<LocalLeader>d`, `<LocalLeader>D` (drop)

It accepts an optional parameter to change the default prefix from `<LocalLeader>` to something else, e.g. `<Leader>`.

## Usage
Use `<Plug>(git-rebase-mappings-abbreviate)` and `<Plug>(git-rebase-mappings-expand)` to turn e.g. `p` into `pick` and vice versa. This works on the whole buffer for all git-rebase commands.

Use `<LocalLeader>p` and `<LocalLeader>P` to change the command in the current line to `p` or `pick`. Use visual mode to change multiple lines at once.  
An operator is not provided for this, since the usual case is to change only the current line.  
Other git-rebase commands such as `exec` are not added for this kind of maping since they don't make sense in this context.

## Requirements
Developed and tested on Neovim `0.9.1`.
