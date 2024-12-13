return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
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
    { "<leader>f", "<Cmd>Telescope find_files<CR>", desc = "Open files picker" },
    { "<leader>F", "<Cmd>Telescope git_files<CR>", desc = "Open git files picker" },
    { "<leader>g", "<Cmd>Telescope git_status<CR>", desc = "Open modified buffers" },
    { "<leader>h", "<Cmd>Telescope help_tags<CR>", desc = "Open help tags" },
    { "<leader>O", "<Cmd>Telescope oldfiles<CR>", desc = "Open previous files" },
    { "<leader>W", "<Cmd>Telescope grep_string<CR>", desc = "Find word under cursor" },
    {
      "<leader>M",
      function() require("utils.telescope").live_multigrep(require("telescope.themes").get_ivy()) end,
      desc = "Find word under cursor",
    },
    {
      "<leader>C",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end,
      desc = "Open help tags",
    },

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

    local picker_options = function(picker_options)
      local options = picker_options or {}
      return vim.tbl_extend("force", { theme = "ivy" }, options)
    end

    telescope.setup({
      defaults = require("telescope.themes").get_ivy(),
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_ivy(),
        },
      },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
  end,
}
