return {
	{
		"marko-cerovac/material.nvim",
		config = function()
			require("material").setup({
				styles = {
					comments = { italic = true },
					functions = { bold = true },
				},
			})

			vim.g.material_style = "darker"
		end,
	},
}
