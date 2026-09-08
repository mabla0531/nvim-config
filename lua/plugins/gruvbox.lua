return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      invert_selection = true,
    },
    config = function()
      local gruvbox = require("gruvbox");
      local palette = gruvbox.palette;

      gruvbox.setup({
        overrides = {
          GruvboxRedUnderline    = { underline = true, undercurl = false, sp = palette.bright_red },
          GruvboxGreenUnderline  = { underline = true, undercurl = false, sp = palette.bright_green },
          GruvboxYellowUnderline = { underline = true, undercurl = false, sp = palette.bright_yellow },
          GruvboxBlueUnderline   = { underline = true, undercurl = false, sp = palette.bright_blue },
          GruvboxPurpleUnderline = { underline = true, undercurl = false, sp = palette.bright_purple },
          GruvboxAquaUnderline   = { underline = true, undercurl = false, sp = palette.bright_aqua },
          GruvboxOrangeUnderline = { underline = true, undercurl = false, sp = palette.bright_orange },
        },
      });
    end
  },
}
