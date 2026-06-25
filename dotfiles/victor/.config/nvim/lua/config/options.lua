-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = true
-- vim.g.lazyvim_lsp = "bufread"

local opt = vim.opt

opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Size of an indent
opt.clipboard = ""
opt.expandtab = true -- Use spaces instead of tabs


vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
        vim.opt_local.showbreak = "↳ "
    end,
})
