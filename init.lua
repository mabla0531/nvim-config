vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/famiu/bufdelete.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/blazkowolf/gruber-darker.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/echasnovski/mini.statusline",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mg979/vim-visual-multi",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

require("keymaps")
require("setup")
require("options")
require("lsp")



-- set colorscheme
vim.cmd.colorscheme("gruber-darker")

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = false, underline = true, sp = "#f43841" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = false, underline = true, sp = "#ffdd33" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = false, underline = true, sp = "#ffffff" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = false, underline = true, sp = "#ffffff" })
