return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      local theme = require("telescope.themes").get_dropdown()

      require("dressing").setup({
        select = {
          backend = { "telescope" },
          telescope = theme,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
    opts = {
      styles = {
        keywords = { italic = false },
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        scope = {
          show_start = false,
          show_end = false,
          highlight = { "@keyword" },
          char = "▏",
          include = {
            node_type = {
              lua = { "table_constructor" },
            },
          },
        },
        whitespace = {
          remove_blankline_trail = true,
        },
        indent = { char = "▏" },
      })
    end,
  },
}
