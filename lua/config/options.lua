-- disable tildes
vim.opt.fillchars = { eob = " " }

-- enable relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- enable spaces instead of tabs
vim.opt.expandtab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "json", "yaml", "html", "css", "jsx", "tsx" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- enable clipboard sync
vim.opt.clipboard = "unnamedplus"

-- treesitter stuff and things
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"rust",
		"svelte",
		"javascript",
		"typescript",
		"zig",
		"c",
		"cpp",
	},

	callback = function()
		vim.treesitter.start()
	end,
})

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
