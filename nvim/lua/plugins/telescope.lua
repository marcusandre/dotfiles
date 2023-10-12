return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    keys = {
      -- stylua: ignore start
      { "<leader>'",  '<Cmd>Telescope resume<CR>',                           desc = 'Resume' },
      { '<leader>/',  '<Cmd>Telescope live_grep<CR>',                        desc = 'Live Grep' },
      { '<leader>:',  '<Cmd>Telescope command_history<CR>',                  desc = 'Commands' },
      { '<leader>fD', '<Cmd>Telescope diagnostics<CR>',                      desc = 'Diagnostics (Workspace)' },
      { '<leader>fO', '<Cmd>Telescope oldfiles<CR>',                         desc = 'Old Files (Workspace)' },
      { '<leader>fS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>',    desc = 'LSP: Symbols (Workspace)' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>',                          desc = 'Buffers' },
      { '<leader>fc', '<Cmd>Telescope current_buffer_fuzzy_find<CR>',        desc = 'Document' },
      { '<leader>fd', '<Cmd>Telescope diagnostics bufnr=0<CR>',              desc = 'Diagnostics (Buffer)' },
      { '<leader>ff', "<Cmd>lua require('m.telescope').project_files()<CR>", desc = 'Files' },
      { '<leader>fg', '<Cmd>Telescope git_status<cr>',                       desc = 'Git' },
      { '<leader>fh', '<Cmd>Telescope help_tags<cr>',                        desc = 'Help' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>',                         desc = 'Jumplist' },
      { '<leader>fo', '<Cmd>Telescope oldfiles only_cwd=true<CR>',           desc = 'Old Files' },
      { '<leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>',             desc = 'LSP: Symbols' },
      { '<leader>ft', '<Cmd>Telescope treesitter<CR>',                       desc = 'Document (Treesitter)' },
      { 'gD',         '<Cmd>Telescope lsp_type_definitions<CR>',             desc = 'LSP: Type definitions' },
      { 'gd',         '<Cmd>Telescope lsp_definitions<CR>',                  desc = 'LSP: Definitions' },
      { 'gi',         '<Cmd>Telescope lsp_implementations<CR>',              desc = 'LSP: Implementations' },
      { 'gr',         '<Cmd>Telescope lsp_references<CR>',                   desc = 'LSP: References' },
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
