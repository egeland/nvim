return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  config = function()
    require("null-ls").setup()
  end,
}
