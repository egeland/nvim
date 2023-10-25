return {
  "ethanholz/nvim-lastplace",
  event = "BufRead",
  config = function()
    require("nvim-lastplace").setup {}
  end,
}

