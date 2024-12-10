return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  enabled = true,
  tag = "0.1.8",
  keys = {
    -- General
    { ",", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in current buffer" },
    { "<leader>'", "<Cmd>Telescope resume<CR>", desc = "Open last picker" },
    { "<leader>/", "<Cmd>Telescope live_grep<CR>", desc = "Global search in workspace folder" },
    { "<leader>b", "<Cmd>Telescope buffers<CR>", desc = "Open buffers picker" },
    { "<leader>F", "<Cmd>Telescope git_files<CR>", desc = "Open git files picker" },
    { "<leader>f", "<Cmd>Telescope find_files<CR>", desc = "Open files picker" },
    { "<leader>g", "<Cmd>Telescope git_status<CR>", desc = "Open modified buffers" },
    { "<leader>h", "<Cmd>Telescope help_tags<CR>", desc = "Open help tags" },

    -- LSP
    { "<leader>d", "<Cmd>Telescope diagnostics<CR>", desc = "Open workspace diagnostics picker (LSP)" },
    { "<leader>s", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "Go to document symbol (LSP)" },
    { "<leader>S", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Go to workspace symbol (LSP)" },
    { "gd", "<Cmd>Telescope lsp_definitions<CR>", desc = "Go to definitions (LSP)" },
    { "gI", "<Cmd>Telescope lsp_implementations<CR>", desc = "Go to implementation (LSP)" },
    { "gr", "<Cmd>Telescope lsp_references<CR>", desc = "Go to references (LSP)" },
    { "gY", "<Cmd>Telescope lsp_type_definitions<CR>", desc = "Go to type definitions (LSP)" },
  },
  opts = {},
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
  end,
}
