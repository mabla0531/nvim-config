return { {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      hl.DiagnosticUnderlineError = { undercurl = false, underline = true, sp = c.error }
      hl.DiagnosticUnderlineWarn = { undercurl = false, underline = true, sp = c.warning }
      hl.DiagnosticUnderlineInfo = { undercurl = false, underline = true, sp = c.info }
      hl.DiagnosticUnderlineHint = { undercurl = false, underline = true, sp = c.hint }
    end,
  },
} }
