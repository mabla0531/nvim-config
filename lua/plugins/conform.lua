return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					svelte = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					go = { "gofmt", "goimports" },
					rust = { "rustfmt" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					zig = { "zigfmt" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				},

				notify_on_error = true,
			})
		end,
	},
}
