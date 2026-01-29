return {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "ristretto",
        transparent_background = true,
      })
    end
  }
}
