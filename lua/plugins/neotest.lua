return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python"
  },
  event = {"BufRead *.rs", "BufRead *.py"},
  config = function(_, opts)
      require("neotest").setup {
        adapters = {
          require "neotest-rust",
          require "neotest-python",
          -- require "neotest-vim-test" {
          --   ignore_file_types = { "python", "vim", "lua" },
          -- },
        },
      }
      vim.keymap.set('n', '<leader>t', "<CMD>Neotest run<CR>", { desc = 'Neotest Run' })
      vim.keymap.set('n', '<leader>tr', "<CMD>Neotest run<CR>", { desc = 'Neotest Run' })
      vim.keymap.set('n', '<leader>ts', "<CMD>Neotest summary<CR>", { desc = 'Neotest Summary' })
    end,
}
