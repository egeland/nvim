return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
  lazy = false,
  opts = function(_, opts)
		return require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.10,
    })
	end
}
