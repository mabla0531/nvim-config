-- ----BUFFERLINE----

require("bufferline").setup({
  options = {
    themable = true,
    mode = "buffers",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and "" or ""
      return " " .. icon .. " " .. count
    end,
    separator_style = "slant",
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    custom_filter = function(buf_number, _)
      if vim.api.nvim_buf_get_name(buf_number) == ""
          and vim.bo[buf_number].buftype == ""
          and not vim.bo[buf_number].modified then
        return false
      end
      return true
    end,
  },
})

-- ----CONFORM----

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

-- ----GRUBER DARKER----

require("gruber-darker").setup({
  bold = false,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },

  undercurl = false,
  underline = true,
})

-- ----KANAGAWA----

require("kanagawa").setup({
  undercurl = false,
})

-- ----MINI STATUSLINE----

require("mini.statusline").setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local location = "%l:%c"
      return MiniStatusline.combine_groups({
        { hl = mode_hl,      strings = { mode } },
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

-- ----CMP----

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- ----SNACKS----

require("snacks").setup({
  picker = {
    enabled = true,
    sources = {
      select = {
        prompt = "",
        layout = {
          preset = "select",
          preview = false,
          layout = {
            backdrop = false,
            relative = "cursor",
            row = 1,
            width = 50,
            height = 10,
            border = "rounded",
            box = "vertical",
            { win = "input", height = 1,     border = "bottom" },
            { win = "list",  border = "none" },
          },
        },
        format = function(item)
          return { { item.text or item.label or item } }
        end,
      },
    },
  },
})

-- ----TINY INLINE DIAGNOSTIC----

require("tiny-inline-diagnostic").setup({
  preset = "simple",
  options = {
    show_code = false,
    set_arrow_to_diag_color = true,
    add_messages = {
      display_count = true,
    },
    multilines = {
      enabled = true,
      always_show = false,
    },
  },
})

-- ----TREESITTER----

require("nvim-treesitter").install({
  "lua",
  "rust",
  "svelte",
  "javascript",
  "typescript",
  "zig",
  "c",
  "cpp",
})

-- ----WHICH KEY----

require("which-key").setup({
  preset = "helix",
  spec = {
    { "<leader>r", icon = { icon = "󰑕", hl = "WhichKeyIconAzure" } },
    { "<leader>fg", icon = { icon = "", hl = "WhichKeyIconGreen" } },
  },
})
