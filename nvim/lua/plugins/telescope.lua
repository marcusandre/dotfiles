return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
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
      { '<leader>l', '<Cmd>Telescope spell_suggest<CR>',                 desc = 'Open spelling picker' },
      { '<leader>o', '<Cmd>Telescope oldfiles only_cwd=true<CR>',        desc = 'Open old files' },
      { '<leader>s', '<Cmd>Telescope lsp_document_symbols<CR>',          desc = 'Open symbol picker' },
      { 'g/',        '<Cmd>Telescope grep_string<CR>',                   desc = 'Global search word under cursor' },
      { 'gD',        '<Cmd>Telescope lsp_type_definitions<CR>',          desc = 'Open type definitions' },
      { 'gd',        '<Cmd>Telescope lsp_definitions<CR>',               desc = 'Open definitions' },
      { 'gi',        '<Cmd>Telescope lsp_implementations<CR>',           desc = 'Open implementations' },
      { 'gr',        '<Cmd>Telescope lsp_references<CR>',                desc = 'Open references' },
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
