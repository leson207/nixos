return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opt={
        contrast = "hard", -- "hard" | "medium" | "soft"
    },
    config = function()
        vim.o.background = "light"
        vim.opt.termguicolors = true
        vim.cmd.colorscheme("gruvbox")
    end,
}
