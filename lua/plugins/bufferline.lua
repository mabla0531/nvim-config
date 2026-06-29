return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>",   "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    },
    opts = {
      options = {
        themable = true,
        mode = "buffers",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "" or ""
          return " " .. icon .. " " .. count
        end,
        separator_style = "slant",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            separator = true,
            text_align = "left",
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        custom_filter = function(buf_number, _)
          if vim.bo[buf_number].filetype == "neo-tree" then
            return false
          end
          return true
        end,
      },
    },
  },
}
