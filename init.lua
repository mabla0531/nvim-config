require("config.lazy")

require("config.options")
require("config.keymaps")

-- set colorscheme
vim.cmd.colorscheme("gruber-darker")

vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, sp = "#e4e4ef" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, sp = "#e4e4ef" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "#ffdd33" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#f43841" })
