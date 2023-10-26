return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "python", "rust", "bash", "dockerfile", "json", "make", "markdown",
        "markdown_inline", "nix", "requirements", "toml", "yaml" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
