return { {
  "shatur/neovim-ayu",
  config = function()
    require('ayu').setup({
      overrides = {
        DiagnosticUnderlineError = { underline = true, undercurl = false },
        DiagnosticUnderlineWarn = { underline = true, undercurl = false },
        DiagnosticUnderlineInfo = { underline = true, undercurl = false },
        DiagnosticUnderlineHint = { underline = true, undercurl = false },
      }
    })
  end
} }
