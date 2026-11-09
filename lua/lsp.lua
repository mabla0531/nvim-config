vim.lsp.enable({
	"rust_analyzer",
	"tailwindcss",
	"svelte",
	"ts_ls",
	"clangd",
	"zls",
	"lua_ls",
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

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
	underline = true,
	signs = false,
	virtual_text = false,
	virtual_lines = false,
})
