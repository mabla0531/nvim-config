-- delete buffers
vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = "Close Buffer" })

-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree", silent = true })

-- paste without yank
vim.keymap.set("x", "p", "P", { desc = "Paste without yanking" })

-- prevent too long shift key press
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev QA qa")
vim.cmd("cnoreabbrev W w")

-- add buffer navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = " Code actions" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = " Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = " Live Grep" })

-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = " Go to Definition" })

-- resize panes
vim.keymap.set("n", "<S-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<S-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<S-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ToggleTerm
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle Terminal", silent = true })
