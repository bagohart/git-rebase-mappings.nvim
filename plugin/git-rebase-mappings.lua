vim.keymap.set(
    'n',
    '<Plug>(git-rebase-mappings-abbreviate)',
    [[:silent! keeppatterns %s/\v^(pick|reword|edit|squash|fixup|exec|break|drop|label|reset|merge|update-ref)>/\=]]
        .. [[{'pick':'p', 'reword':'r', 'edit':'e', 'squash':'s', 'fixup':'f', 'exec':'x', 'break':'b', 'drop':'d', 'label':'l', 'reset':'t', 'merge':'m', 'update-ref':'u'}]]
        .. [[[submatch(0)]/<CR>``]],
    { buffer = true, desc = 'Abbreviate git rebase commands.' }
)
vim.keymap.set(
    'n',
    '<Plug>(git-rebase-mappings-expand)',
    [[:silent! keeppatterns %s/\v^(p|r|e|s|f|x|b|d|l|t|m|u)>/\=]]
        .. [[{'p':'pick', 'r':'reword', 'e':'edit', 's':'squash', 'f':'fixup', 'x':'exec', 'b':'break', 'd':'drop', 'l':'label', 't':'reset', 'm':'merge', 'u':'update-ref'}]]
        .. [[[submatch(0)]/<CR>``]],
    { buffer = true, desc = 'Replace one-letter abbreviations for git rebase commands with whole words.' }
)
