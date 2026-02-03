return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			window = {
				width = 24,
				auto_expand_width = true,
			},

			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
				},
			},
			filesystem = {
				components = {
					name = function(config, node, state)
						local name = node.name
						-- If this is the root node, show only the folder name
						if node:get_depth() == 1 then
							name = vim.fn.fnamemodify(state.path, ":t")
							if name == "" then
								name = vim.fn.fnamemodify(state.path, ":~")
							end
						end
						return {
							text = name,
							highlight = config.highlight or "NeoTreeFileName",
						}
					end,
				},
			},
		},
	},
}
