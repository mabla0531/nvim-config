-- delete buffers
vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = " Close Buffer" })

-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = " Toggle NeoTree", silent = true })

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

-- add buffer resizing
local function is_leftmost()
	return vim.fn.winnr() == vim.fn.winnr("h")
end
local function is_bottommost()
	return vim.fn.winnr() == vim.fn.winnr("j")
end

vim.keymap.set("n", "<A-h>", function()
	if is_leftmost() then
		vim.cmd("vertical resize -2")
	else
		vim.cmd("vertical resize +2")
	end
end)

vim.keymap.set("n", "<A-l>", function()
	if is_leftmost() then
		vim.cmd("vertical resize +2")
	else
		vim.cmd("vertical resize -2")
	end
end)

vim.keymap.set("n", "<A-j>", function()
	if is_bottommost() then
		vim.cmd("resize -2")
	else
		vim.cmd("resize +2")
	end
end)

vim.keymap.set("n", "<A-k>", function()
	if is_bottommost() then
		vim.cmd("resize +2")
	else
		vim.cmd("resize -2")
	end
end)

-- exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- disable fuckass '<,'> thing when pressing colon in visual mode
vim.keymap.set("v", ":", ":<C-u>", { noremap = true })

-- code actions
vim.keymap.set({ "n", "v" }, "<C-a>", vim.lsp.buf.code_action, { desc = " Code Actions" })
vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = " Rename All" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = " Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = " Live Grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = " Find References" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { desc = " Find Definitions" })
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { desc = " Find Implementations" })

-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = " Go to Definition" })

-- ToggleTerm
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = " Toggle Terminal", silent = true })

-- quick visual mode select
vim.keymap.set({ "n" }, "H", "vb", { noremap = true })
vim.keymap.set({ "v" }, "H", "b", { noremap = true })
vim.keymap.set({ "n" }, "L", "ve", { noremap = true })
vim.keymap.set({ "v" }, "L", "e", { noremap = true })
vim.keymap.set({ "v" }, "a", "be", { noremap = true })

-- disable help menu
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>")
