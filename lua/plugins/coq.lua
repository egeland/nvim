return {
  "ms-jpq/coq_nvim",
  lazy = false,
  build = ":COQnow",
  dependencies = {
    "ms-jpq/coq.artifacts",
    "ms-jpq/coq.thirdparty",
  },
  config = function()
    require('coq_3p') {
      { src = "nvimlua", short_name = "nLUA", conf_only = true },
      { src = "copilot", short_name = "COP", accept_key = "<c-f>" }
    }
  end
}
