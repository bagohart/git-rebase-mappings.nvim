local function create_commit_command_mappings()
    local commitCommandsShort = { p = 'p', r = 'r', e = 'e', s = 's', f = 'f', d = 'd' }
    for key, val in pairs(commitCommandsShort) do
        local opt = { buffer = true, desc = "Change current command to '" .. val .. "'" }
        -- the WWBB aborts the command if not enough text is there. that's a very simple detection if the command shouldn't be run on this line.
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
