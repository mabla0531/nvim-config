return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				enabled = true,
				sources = {
					select = {
						prompt = "",
						layout = {
							preset = "select",
							preview = false,
							layout = {
								backdrop = false,
								relative = "cursor",
								row = 1,
								width = 50,
								height = 10,
								border = "rounded",
								box = "vertical",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
							},
						},
						format = function(item)
							return { { item.text or item.label or item } }
						end,
					},
				},
			},
		},
	},
}
