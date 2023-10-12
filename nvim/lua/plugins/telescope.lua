return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    keys = {
      -- stylua: ignore start
      { "<leader>'",  '<Cmd>Telescope resume<CR>',                           desc = 'Resume' },
      { '<leader>/',  '<Cmd>Telescope live_grep<CR>',                        desc = 'Search in workspace folder' },
      { '<leader>:',  '<Cmd>Telescope command_history<CR>',                  desc = 'Command history' },
      { '<leader>fD', '<Cmd>Telescope diagnostics<CR>',                      desc = 'Workspace diagnostic picker' },
      { '<leader>fO', '<Cmd>Telescope oldfiles<CR>',                         desc = 'Old files (global)' },
      { '<leader>fS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>',    desc = 'Workspace symbol picker' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>',                          desc = 'Buffer picker' },
      { '<leader>fc', '<Cmd>Telescope current_buffer_fuzzy_find<CR>',        desc = 'Buffer fuzzy search' },
      { '<leader>fd', '<Cmd>Telescope diagnostics bufnr=0<CR>',              desc = 'Diagnostic picker' },
      { '<leader>ff', "<Cmd>lua require('m.telescope').project_files()<CR>", desc = 'File picker (git)' },
      { '<leader>fg', '<Cmd>Telescope git_status<cr>',                       desc = 'Changed files' },
      { '<leader>fh', '<Cmd>Telescope help_tags<cr>',                        desc = 'Help tags' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>',                         desc = 'Jumplist picker' },
      { '<leader>fo', '<Cmd>Telescope oldfiles only_cwd=true<CR>',           desc = 'Old files' },
      { '<leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>',             desc = 'Symbol picker' },
      { '<leader>ft', '<Cmd>Telescope treesitter<CR>',                       desc = 'Buffer treesitter search' },
      { 'gD',         '<Cmd>Telescope lsp_type_definitions<CR>',             desc = 'Type definitions' },
      { 'gd',         '<Cmd>Telescope lsp_definitions<CR>',                  desc = 'Definitions' },
      { 'gi',         '<Cmd>Telescope lsp_implementations<CR>',              desc = 'Implementations' },
      { 'gr',         '<Cmd>Telescope lsp_references<CR>',                   desc = 'References' },
      { 'gw',         '<Cmd>Telescope grep_string<CR>',                      desc = 'Search word under cursor' },
      -- stylua: ignore end
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_config = {
            prompt_position = "top",
          },
          preview = {
            filesize_limit = 0.1, -- MB
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
          git_files = { show_untracked = true },
          colorscheme = { enable_preview = true, theme = "dropdown" },
          current_buffer_fuzzy_find = { theme = "dropdown" },
          treesitter = { theme = "dropdown" },
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
