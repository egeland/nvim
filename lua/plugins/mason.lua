return {
  'junnplus/lsp-setup.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'simrat39/rust-tools.nvim',
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
              on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
              end,
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
  end
}
