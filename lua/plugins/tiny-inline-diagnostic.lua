return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			preset = "modern",
			options = {
				show_code = false,
				set_arrow_to_diag_color = true,
				add_messages = {
					display_count = true,
				},
				multilines = {
					enabled = true,
					always_show = false,
				},
			},
		},
	},
}
