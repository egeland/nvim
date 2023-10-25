return {
    'saecki/crates.nvim',
    branch = 'main',
    dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup({
        src = {
          cmp = {
            enabled = true,
          },
        },
      })
    require("crates.src.cmp").setup()
    end
}
