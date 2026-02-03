return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 16,
				open_mapping = [[<c-t>]],
				direction = "horizontal",
				shade_terminals = true,
				start_in_insert = true,
				persist_size = true,
			})
		end,
	},
}
