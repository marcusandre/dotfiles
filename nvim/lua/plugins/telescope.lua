return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    lazy = false,
    keys = {
      -- stylua: ignore start
      { "<leader>'", '<Cmd>Telescope resume<CR>',                        desc = 'Open last picker' },
      { '<leader>/', '<Cmd>Telescope live_grep<CR>',                     desc = 'Global search in workspace folder' },
      { '<leader>:', '<Cmd>Telescope command_history<CR>',               desc = 'Open command history' },
      { '<leader>D', '<Cmd>Telescope diagnostics<CR>',                   desc = 'Open workspace diagnostic picker' },
      { '<leader>F', '<Cmd>Telescope find_files<cr>',                    desc = 'Open file picker' },
      { '<leader>I', '<Cmd>Telescope treesitter<CR>',                    desc = 'Open buffer treesitter search' },
      { '<leader>O', '<Cmd>Telescope oldfiles<CR>',                      desc = 'Open old files' },
      { '<leader>S', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Open workspace symbol picker' },
      { '<leader>b', '<Cmd>Telescope buffers<CR>',                       desc = 'Open buffer picker' },
      { '<leader>d', '<Cmd>Telescope diagnostics bufnr=0<CR>',           desc = 'Open diagnostic picker' },
      { '<leader>f', '<Cmd>Telescope git_files<cr>',                     desc = 'Open file picker (git)' },
      { '<leader>g', '<Cmd>Telescope git_status<cr>',                    desc = 'Open changed files' },
      { '<leader>h', '<Cmd>Telescope help_tags<cr>',                     desc = 'Open help tags' },
      { '<leader>i', '<Cmd>Telescope current_buffer_fuzzy_find<CR>',     desc = 'Open buffer fuzzy search' },
      { '<leader>j', '<Cmd>Telescope jumplist<CR>',                      desc = 'Open jumplist picker' },
      { '<leader>o', '<Cmd>Telescope oldfiles only_cwd=true<CR>',        desc = 'Open old files' },
      { '<leader>s', '<Cmd>Telescope lsp_document_symbols<CR>',          desc = 'Open symbol picker' },
      { 'g/',        '<Cmd>Telescope grep_string<CR>',                   desc = 'Global search word under cursor' },
      { 'gD',        '<Cmd>Telescope lsp_type_definitions<CR>',          desc = 'Goto type definition' },
      { 'gd',        '<Cmd>Telescope lsp_definitions<CR>',               desc = 'Goto definitions' },
      { 'gi',        '<Cmd>Telescope lsp_implementations<CR>',           desc = 'Goto implementations' },
      { 'gr',        '<Cmd>Telescope lsp_references<CR>',                desc = 'Goto references' },
      -- stylua: ignore end
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fuzzy = require("mini.fuzzy")

      telescope.setup({
        defaults = {
          border = true,
          cache = false,
          dynamic_preview_title = true,
          file_sorter = fuzzy.get_telescope_sorter,
          generic_sorter = fuzzy.get_telescope_sorter,
          layout_strategy = "flex",
          scroll_strategy = "cycle",
          selection_strategy = "reset",
          winblend = 0,
          layout_config = {
            vertical = {
              mirror = true,
            },
            center = {
              mirror = true,
            },
          },
        },
        pickers = {
          buffers = {
            sort_lastused = true,
            sort_mru = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
              i = { ["<c-d>"] = actions.delete_buffer },
            },
          },
          find_files = {
            find_command = vim.fn.executable("fd") == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
          },
          git_files = { show_untracked = true },
          colorscheme = { enable_preview = true, theme = "dropdown" },
          current_buffer_fuzzy_find = { theme = "dropdown" },
          treesitter = { theme = "dropdown" },
          lsp_code_actions = { theme = "dropdown" },
          lsp_definitions = { path_display = { "shorten" }, trim_text = true },
          lsp_dynamic_workspace_symbols = { path_display = { "shorten" } },
          lsp_implementations = { path_display = { "shorten" } },
          lsp_references = { path_display = { "shorten" } },
          lsp_type_definitions = { path_display = { "shorten" } },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
}
