return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        day_brightness = 0.2,
      })
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
      })
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
      show_current_context = true,
      -- show_current_context_start = true,
    },
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd([[colorscheme tokyonight-night]])
      end,
      set_light_mode = function()
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd([[colorscheme tokyonight-storm]])
      end,
    },
  },
}
