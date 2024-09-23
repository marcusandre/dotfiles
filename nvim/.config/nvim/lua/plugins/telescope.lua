return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  cmd = "Telescope",
  keys = {
    -- Buffers
    { "<leader>f", "<Cmd>Telescope find_files<CR>", { desc = "Open file picker" } },
    { "<leader>b", "<Cmd>Telescope buffers<CR>", { desc = "Open buffer picker" } },
    { "<leader>g", "<Cmd>Telescope git_status<CR>", { desc = "Open changed file picker" } },
    { "<leader>d", "<Cmd>Telescope diagnostics<CR>", { desc = "Open diagnostic picker" } },
    { "<leader>D", "<Cmd>Telescope diagnostics<CR>", { desc = "Open workspace diagnostic picker" } },

    -- LSP
    { "<leader>s", "<Cmd>Telescope lsp_document_symbols<CR>", { desc = "Open symbol picker" } },
    { "<leader>S", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Open workspace symbol picker" } },
    { "gI", "<Cmd>Telescope lsp_implementations<CR>", { desc = "Goto implementation" } },
    { "gd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "Goto definition" } },
    { "gr", "<Cmd>Telescope lsp_references<CR>", { desc = "Goto references" } },
    { "gy", "<Cmd>Telescope lsp_type_definitions<CR>", { desc = "Goto type definition" } },

    -- Others
    { ",", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
    { "<leader>'", "<Cmd>Telescope resume<CR>", { desc = "Open last picker" } },
    { "<leader>/", "<Cmd>Telescope live_grep<CR>", { desc = "Global search in workspace folder" } },
    { "<leader>?", "<Cmd>Telescope command_history<CR>", { desc = "Show command palette" } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  },
  config = function(opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
  end,
}
