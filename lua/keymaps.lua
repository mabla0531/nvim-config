vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- bufferline
vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = " Close Buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })

-- yazi
vim.keymap.set("n", "<leader>e", function() require("yazi").yazi() end, { desc = " Toggle NeoTree", silent = true })

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
vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = " Code Actions" })
vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = " Rename All" })

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = " Find Files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = " Live Grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = " Find References" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { desc = " Find Definitions" })
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { desc = " Find Implementations" })

-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = " Go to Definition" })

-- ToggleTerm
local term = { buf = nil, win = nil }

local function toggle_terminal()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    term.win = nil
    return
  end

  vim.cmd("botright 12split")
  term.win = vim.api.nvim_get_current_win()

  if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
    vim.api.nvim_win_set_buf(term.win, term.buf)
  else
    vim.cmd.terminal()
    term.buf = vim.api.nvim_get_current_buf()
    vim.bo[term.buf].buflisted = false
  end

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", toggle_terminal, { desc = "Toggle Terminal", silent = true })

vim.api.nvim_create_autocmd("TermClose", {
  callback = function(args)
    if args.buf == term.buf then
      term.buf = nil
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(args.buf) then
          vim.api.nvim_buf_delete(args.buf, { force = true })
        end
      end)
    end
  end,
})

-- quick visual mode select
vim.keymap.set("n", "H", "vb", { noremap = true })
vim.keymap.set("v", "H", "b", { noremap = true })
vim.keymap.set("n", "L", "ve", { noremap = true })
vim.keymap.set("v", "L", "e", { noremap = true })

-- disable help menu
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>")

vim.keymap.set({ "i", "c" }, "<M-BS>", "<C-w>")

-- flash
vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })

-- hex dump
vim.keymap.set("n", "<leader>h", function()
  require("hex").toggle()
end, { desc = "Open hex dump" })
