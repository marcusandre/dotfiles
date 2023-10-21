return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    keys = {
      -- stylua: ignore start
      { '<leader>/',  '<Cmd>Telescope live_grep<CR>',                        desc = 'Grep live' },
      { '<leader>:',  '<Cmd>Telescope command_history<CR>',                  desc = 'Commands' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>',                          desc = 'Buffers' },
      { '<leader>fd', '<Cmd>Telescope diagnostics bufnr=0<CR>',              desc = 'Diagnostics (Buffer)' },
      { '<leader>fD', '<Cmd>Telescope diagnostics<CR>',                      desc = 'Diagnostics (Workspace)' },
      { '<leader>ff', '<Cmd>lua require("m.telescope").project_files()<CR>', desc = 'Files' },
      { '<leader>fg', '<Cmd>Telescope git_status<cr>',                       desc = 'Git' },
      { '<leader>fh', '<Cmd>Telescope help_tags<cr>',                        desc = 'Help tags' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>',                         desc = 'Jumplist' },
      { '<leader>fl', '<Cmd>Telescope current_buffer_fuzzy_find<CR>',        desc = 'Lines (current)' },
      { '<leader>fo', '<Cmd>Telescope oldfiles only_cwd=true<CR>',           desc = 'Old Files' },
      { '<leader>fO', '<Cmd>Telescope oldfiles<CR>',                         desc = 'Old Files (Workspace)' },
      { '<leader>fr', '<Cmd>Telescope resume<CR>',                           desc = 'Resume' },
      { '<leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>',             desc = 'Symbols current (LSP)' },
      { '<leader>fS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>',    desc = 'Symbols workspace (LSP)' },
      { '<leader>ft', '<Cmd>Telescope treesitter<CR>',                       desc = 'Document (Treesitter)' },
      { 'gd',         '<Cmd>Telescope lsp_definitions<CR>',                  desc = 'Definitions (LSP)' },
      { 'gD',         '<Cmd>Telescope lsp_type_definitions<CR>',             desc = 'Type definitions (LSP)' },
      { 'gi',         '<Cmd>Telescope lsp_implementations<CR>',              desc = 'Implementations (LSP)' },
      { 'gr',         '<Cmd>Telescope lsp_references<CR>',                   desc = 'References (LSP)' },
      { 'gw',         '<Cmd>Telescope grep_string<CR>',                      desc = 'Grep current word' },
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
          generic_sorter = require('mini.fuzzy').get_telescope_sorter,
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
