return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        day_brightness = 0.2,
      })
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end,
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
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
        indent = { char = "┊" },
      })
    end,
  },
}
