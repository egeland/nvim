return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "bashls", "dockerls", "jsonls", "lua_ls", "marksman", "pylsp", "rust_analyzer" },
    }
  end
}
