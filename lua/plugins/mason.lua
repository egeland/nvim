return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "simrat39/rust-tools.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "bashls", "dockerls", "jsonls", "lua_ls", "marksman", "pylsp", "rust_analyzer" },
    }
    require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end,
        ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end
    }
  end
}
