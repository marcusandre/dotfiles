return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      local theme = require("telescope.themes").get_dropdown()

      theme.layout_config = {
        width = 60,
        height = 17,
      }

      require("dressing").setup({
        input = {
          enabled = false,
        },
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
  {
    "folke/twilight.nvim",
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
    opts = {
      expand = {
        "function_definition",
        "table_constructor",
      },
    },
  },
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {
  --     update_interval = 1000,
  --     set_dark_mode = function()
  --       vim.api.nvim_set_option("background", "dark")
  --       vim.cmd([[colorscheme tokyonight-storm]])
  --     end,
  --     set_light_mode = function()
  --       vim.api.nvim_set_option("background", "light")
  --       vim.cmd([[colorscheme dayfox]])
  --     end,
  --   },
  -- },
}
