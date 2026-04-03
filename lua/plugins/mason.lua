return {
	{ "mason-org/mason.nvim", cmd = "Mason", config = true },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"rust_analyzer",
					"tailwindcss",
					"svelte",
					"ts_ls",
					"clangd",
					"zls",
					"lua_ls",
				},
				automatic_enable = {
					exclude = { "vtsls" },
				},
			})

			vim.lsp.inlay_hint.enable(true)

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						check = { command = "clippy" },
						checkOnSave = true,
						diagnostics = { enable = true },
					},
				},
			})

			vim.diagnostic.config({
				underline = true,
				signs = false,
				virtual_text = false,
				virtual_lines = false,
			})
		end,
	},
}
