return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function() vim.cmd.colorscheme("tokyonight") end,
    opts = {
      style = "storm",
      sidebars = {},
      styles = {
        keywords = { italic = false },
      },
    },
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
