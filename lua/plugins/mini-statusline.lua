return {
	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup({

				content = {
					active = function()
						-- Hide in NeoTree
						if vim.bo.filetype == "neo-tree" then
							return ""
						end

						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local location = "%l:%c"
						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "StatusLine", strings = { "" } },
							"%=",
							{ strings = { location } },
						})
					end,
					inactive = function()
						return ""
					end,
				},
			})
		end,
	},
}
