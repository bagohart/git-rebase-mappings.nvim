vim.keymap.set(
    'n',
    '<Plug>(git-rebase-abbreviate)',
    [[:silent! keeppatterns %s/\v^(pick|reword|edit|squash|fixup|exec|break|drop|label|reset|merge|update-ref)>/\=]]
        .. [[{'pick':'p', 'reword':'r', 'edit':'e', 'squash':'s', 'fixup':'f', 'exec':'x', 'break':'b', 'drop':'d', 'label':'l', 'reset':'t', 'merge':'m', 'update-ref':'u'}]]
        .. [[[submatch(0)]/<CR>``]],
    { buffer = true, desc = 'Abbreviate git rebase commands.' }
)
vim.keymap.set(
    'n',
    '<Plug>(git-rebase-expand)',
    [[:silent! keeppatterns %s/\v^(p|r|e|s|f|x|b|d|l|t|m|u)>/\=]]
        .. [[{'p':'pick', 'r':'reword', 'e':'edit', 's':'squash', 'f':'fixup', 'x':'exec', 'b':'break', 'd':'drop', 'l':'label', 't':'reset', 'm':'merge', 'u':'update-ref'}]]
        .. [[[submatch(0)]/<CR>``]],
    { buffer = true, desc = 'Replace one-letter abbreviations for git rebase commands with whole words.' }
)

local function create_commit_command_mappings()
    local commitCommandsShort = { p = 'p', r = 'r', e = 'e', s = 's', f = 'f', d = 'd' }
    for key, val in pairs(commitCommandsShort) do
        local opt = { buffer = true, desc = "Change current command to '" .. val .. "'" }
        vim.keymap.set('n', '<LocalLeader>' .. key, '^WWBBciw' .. val .. '<Esc>W', opt)
        vim.keymap.set('x', '<LocalLeader>' .. key, ':normal! ^WWBBciw' .. val .. '<Esc><CR>`<', opt)
    end

    local commitCommandsLong = { P = 'pick', R = 'reword', E = 'edit', S = 'squash', F = 'fixup', D = 'drop' }
    for key, val in pairs(commitCommandsLong) do
        local opt = { buffer = true, desc = "Change current command to '" .. val .. "'" }
        vim.keymap.set('n', '<LocalLeader>' .. key, '^WWBBciw' .. val .. '<Esc>W', opt)
        vim.keymap.set('x', '<LocalLeader>' .. key, ':normal! ^WWBBciw' .. val .. '<Esc><CR>`<', opt)
    end
end

return {
    create_commit_command_mappings = create_commit_command_mappings,
}
