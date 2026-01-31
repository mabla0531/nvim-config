return {
	{ "mason-org/mason.nvim", cmd = "Mason", config = true },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"rust_analyzer",
					"ts_ls",
					"tailwindcss",
					"svelte",
					"clangd",
					"zls",
					"lua_ls",
				},
			})

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
				signs = true,
				virtual_text = false,
				virtual_lines = true,
			})

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.cmd([[
            highlight DiagnosticUnderlineError cterm=underline gui=underline 
            highlight DiagnosticUnderlineWarn cterm=underline gui=underline 
            highlight DiagnosticUnderlineInfo cterm=underline gui=underline
            highlight DiagnosticUnderlineHint cterm=underline gui=underline 
          ]])
				end,
			})
		end,
	},
}
