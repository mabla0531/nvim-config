return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
		},
		opts = {
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and "" or ""
					return " " .. icon .. " " .. count
				end,
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)

			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(require("bufferline").setup)
					end)
				end,
			})
		end,
	},
}
