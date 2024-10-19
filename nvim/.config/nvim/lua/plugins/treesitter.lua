return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    local configs = require("nvim-treesitter.configs")

    ---@diagnostic disable-next-line: missing-fields
    configs.setup({
      ensure_installed = {
        "diff",
        "gitcommit",
        "gleam",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ignore_install = {},
    })
  end,
}
