return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local themes = require("telescope.themes")
      local MiniFuzzy = require("mini.fuzzy")

      telescope.setup({
        defaults = {
          generic_sorter = MiniFuzzy.get_telescope_sorter,
          preview = {
            filesize_limit = 0.1, -- MB
          },
        },
        pickers = {
          buffers = {
            sort_lastused = true,
            sort_mru = true,
            mappings = {
              i = { ["<c-d>"] = actions.delete_buffer },
            },
          },
          git_files = { show_untracked = true },
          colorscheme = { enable_preview = true },
        },
        extensions = {
          ["ui-select"] = {
            themes.get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
}
