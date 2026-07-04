return { {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      filter = "ristretto",
      styles = {
        comment = { italic = false },
        keyword = { italic = false },
        type = { italic = false },
        storageclass = { italic = false },
        structure = { italic = false },
        parameter = { italic = false },
        annotation = { italic = false },
        tag_attribute = { italic = false },
      },
      override = function(_)
        return {
          DiagnosticUnderlineError = { underline = true, undercurl = false },
          DiagnosticUnderlineWarn  = { underline = true, undercurl = false },
          DiagnosticUnderlineInfo  = { underline = true, undercurl = false },
          DiagnosticUnderlineHint  = { underline = true, undercurl = false },
          DiagnosticUnderlineOk    = { underline = true, undercurl = false },
        }
      end,
    })
  end
} }
