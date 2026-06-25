return {
	"neovim/nvim-lspconfig",
	lazy=true,
	event="VeryLazy",
	opts = {
		servers = {
			clangd = {
				cmd = {
					"clangd",
					"-j=8",
					"--pch-storage=memory",
					"--background-index",
					"--background-index-priority=background",

					"--pretty",
					"--log=info",
					"--clang-tidy",
					"--header-insertion=never",
					"--completion-parse=always",
					"--completion-style=bundled",
					"--function-arg-placeholders=0",
					"--experimental-modules-support",
					"--fallback-style=llvm",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
		},
	},
}
