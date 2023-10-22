return {
    'saecki/crates.nvim',
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = "toml",
    config = function()
      require('crates').setup {
        src = {
          coq = {
            enabled = true,
            name = "crates.nvim",
          },
        },
      }
    end
}
