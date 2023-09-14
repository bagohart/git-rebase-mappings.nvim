vim.cmd([[
    " the global scope here is ugly, but putting it in script scope (:s) means the function is not available from init.lua
    " so I don't currently have a better solution for this
    function! Git_rebase_mappings_commit_command(cmd)
        function! s:inner(...) closure abort
            execute 'normal! ^WWBBciw' . a:cmd . "\<Esc>W"
        endfunction
        let &opfunc=get(funcref('s:inner'), 'name')
        return 'g@l'
    endfunction
]])

local function create_commit_command_mappings(prefix)
    prefix = prefix or '<LocalLeader>'
    local commitCommandsShort = { p = 'p', r = 'r', e = 'e', s = 's', f = 'f', d = 'd' }
    for key, val in pairs(commitCommandsShort) do
        local opt = { buffer = true, desc = "Change current command to '" .. val .. "'", silent = true }
        -- This worked for using it with vim-repeat (, but I wanted to get rid of that):
        -- vim.keymap.set(
        --     'n',
        --     '<Plug>(git-rebase-mappings-n-use-command-' .. val .. ')',
        --     '^WWBBciw' .. val .. '<Esc>W' .. [[:silent call repeat#set("\<Plug>(git-rebase-mappings-n-use-command-]] .. val .. ')")<CR>',
        --     opt
        -- )
        vim.cmd(
            'nnoremap <silent><expr><buffer> <Plug>(git-rebase-mappings-n-use-command-' .. val .. ') Git_rebase_mappings_commit_command("' .. val .. '")'
        )
        vim.keymap.set('x', '<Plug>(git-rebase-mappings-x-use-command-' .. val .. ')', ':normal! ^WWBBciw' .. val .. '<Esc><CR>`<', opt)
        -- the WWBB aborts the command if not enough text is there. that's a very simple detection if the command shouldn't be run on this line.
        vim.keymap.set('n', prefix .. key, '<Plug>(git-rebase-mappings-n-use-command-' .. val .. ')', { buffer = true })
        vim.keymap.set('x', prefix .. key, '<Plug>(git-rebase-mappings-x-use-command-' .. val .. ')', { buffer = true })
    end

    local commitCommandsLong = { P = 'pick', R = 'reword', E = 'edit', S = 'squash', F = 'fixup', D = 'drop' }
    for key, val in pairs(commitCommandsLong) do
        local opt = { buffer = true, desc = "Change current command to '" .. val .. "'", silent = true }
        -- This worked for using it with vim-repeat (, but I wanted to get rid of that):
        -- vim.keymap.set(
        --     'n',
        --     '<Plug>(git-rebase-mappings-n-use-command-' .. val .. ')',
        --     '^WWBBciw' .. val .. '<Esc>W' .. [[:silent call repeat#set("\<Plug>(git-rebase-mappings-n-use-command-]] .. val .. ')")<CR>',
        --     opt
        -- )
        vim.cmd(
            'nnoremap <silent><expr><buffer> <Plug>(git-rebase-mappings-n-use-command-' .. val .. ') Git_rebase_mappings_commit_command("' .. val .. '")'
        )
        vim.keymap.set('x', '<Plug>(git-rebase-mappings-x-use-command-' .. val .. ')', ':normal! ^WWBBciw' .. val .. '<Esc><CR>`<', opt)
        vim.keymap.set('n', prefix .. key, '<Plug>(git-rebase-mappings-n-use-command-' .. val .. ')', { buffer = true })
        vim.keymap.set('x', prefix .. key, '<Plug>(git-rebase-mappings-x-use-command-' .. val .. ')', { buffer = true })
    end
end

return {
    create_commit_command_mappings = create_commit_command_mappings,
}
