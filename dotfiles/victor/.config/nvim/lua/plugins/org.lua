return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        require('orgmode').setup({
            org_agenda_files = '~/orgfiles/**/*',
            org_default_notes_file = '~/orgfiles/refile.org',
            org_startup_folded = 'showeverything',
            -- org_adapt_indentation = false
            mappings = {
                org_return_uses_meta_return = true,
            }
        })
        -- Experimental LSP support
        vim.lsp.enable('org')
    end,
}
