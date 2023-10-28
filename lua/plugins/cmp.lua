return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "honza/vim-snippets",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
  },
  lazy = false,
  priority = 100,
  config = function()
    local cmp = require('cmp')
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'crates' },
      }, {
        { name = "buffer" },
        { name = "path" },
      })
    })
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['lua_ls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['rust_analyzer'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['bashls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['dockerls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['jsonls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['marksman'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['pylsp'].setup {
      capabilities = capabilities
    }
  end,
}
