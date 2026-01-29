return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"lua",
				"rust",
				"svelte",
				"javascript",
				"typescript",
				"zig",
				"c",
				"cpp",
			})
		end,
	},
}
