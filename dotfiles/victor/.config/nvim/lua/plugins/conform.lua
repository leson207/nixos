return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = {},
      c = {"clang_format"},
      cpp = { "clang_format" },

      -- Remove c from here entirely to prevent any formatter running
      ["*"] = { "trim_whitespace" },
    },
  },
  init = function()
    -- Tell LazyVim's format-on-save to skip c/cpp
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
        vim.b.autoformat = false
      end,
    })
  end,
}
