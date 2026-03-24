return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			spec = {
				{ "<leader>r", icon = { icon = "󰑕", hl = "WhichKeyIconAzure" } },
				{ "<leader>fg", icon = { icon = "", hl = "WhichKeyIconGreen" } },
			},
		},
	},
}
