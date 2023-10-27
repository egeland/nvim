return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "BufRead",
  config = function()
    local wk = require("which-key")
    wk.register({
      f = {
        name = "[F]ile",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      },
      b = {
        name = "[B]uffers",
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        d = { "<cmd>bdelete<cr>", "Delete Buffer" },
      }
    }, { prefix = "<leader>" })
  end
}
