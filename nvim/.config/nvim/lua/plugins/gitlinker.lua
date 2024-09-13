return {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  config = function()
    require("gitlinker").setup({

      router = {
        browse = {
          ["^github"] = require("gitlinker.routers").github_browse,
        },
        blame = {
          ["^github"] = require("gitlinker.routers").github_blame,
        },
      },
    })
  end,
}
