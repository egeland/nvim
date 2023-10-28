return {
  'junnplus/lsp-setup.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'simrat39/rust-tools.nvim',
    'rust-lang/rust.vim',
  },
  lazy = false,
  config = function()
    require("mason").setup({
      PATH = "prepend", -- "skip" seems to cause the spawning error
    })
    require('lsp-setup').setup({
      servers = {
        pylsp = {},
        bashls = {},
        dockerls = {},
        rust_analyzer = function()
          local rt = require('rust-tools')
          rt.setup({
            server = {
              settings = {
                ['rust-analyzer'] = {
                  checkOnSave = {
                    command = "clippy",
                  },
                  cargo = {
                    loadOutDirsFromCheck = true,
                  },
                  procMacro = {
                    enable = true,
                  },
                },
              },
            },
          })
        end,
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = false,
                arrayIndex = "Auto",
                await = true,
                paramName = "All",
                paramType = true,
                semicolon = "SameLine",
                setType = false,
              },
            },
          },
        },
      }
    })
    require("which-key").register({
      r = {
        name = "Rust",
        a = { "<cmd>RustCodeAction<cr>", "Code Action" },
        d = { "<cmd>RustMoveItemDown<cr>", "Move Item Down" },
        f = { "<cmd>RustFmt<cr>", "Format" },
        h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
        j = { "<cmd>RustJoinLines<cr>", "Join Lines" },
        r = { "<cmd>RustRunnables<cr>", "Runnables" },
        u = { "<cmd>RustMoveItemUp<cr>", "Move Item Up" },
      },
    }, { prefix = "<leader>" })
  end
}
