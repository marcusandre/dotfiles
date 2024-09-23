return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.bufremove").setup()
      require("mini.bracketed").setup()
      require("mini.cursorword").setup()
      require("mini.extra").setup()
      require("mini.move").setup()
      require("mini.statusline").setup()
      require("mini.tabline").setup()
      require("mini.trailspace").setup()
    end,
  },
  {
    "echasnovski/mini.pick",
    enabled = false,
    version = false,
    keys = {
      -- Buffers
      { "<leader>f", "<Cmd>Pick files<CR>", { desc = "Open file picker" } },
      { "<leader>b", "<Cmd>Pick buffers<CR>", { desc = "Open buffer picker" } },
      { "<leader>g", "<Cmd>Pick git_hunks<CR>", { desc = "Open changed file picker" } },
      { "<leader>d", '<Cmd>Pick diagnostic scope="current"<CR>', { desc = "Open diagnostic picker" } },
      { "<leader>D", '<Cmd>Pick diagnostic scope="all"<CR>', { desc = "Open workspace diagnostic picker" } },

      -- LSP
      { "<leader>s", '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = "Open symbol picker" } },
      { "<leader>S", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = "Open workspace symbol picker" } },
      { "gD", '<Cmd>Pick lsp scope="declaration"<CR>', { desc = "Goto declaration" } },
      { "gI", '<Cmd>Pick lsp scope="implementation"<CR>', { desc = "Goto implementation" } },
      { "gd", '<Cmd>Pick lsp scope="definition"<CR>', { desc = "Goto definition" } },
      { "gr", '<Cmd>Pick lsp scope="references"<CR>', { desc = "Goto references" } },
      { "gy", '<Cmd>Pick lsp scope="type_definition"<CR>', { desc = "Goto type definition" } },

      -- Others
      { ",", "<Cmd>Pick buf_lines scope='current'<CR>" },
      { "<leader>'", "<Cmd>Pick resume<CR>", { desc = "Open last picker" } },
      { "<leader>/", "<Cmd>Pick grep_live<CR>", { desc = "Global search in workspace folder" } },
      { "<leader>?", "<Cmd>Pick commands<CR>", { desc = "Show command palette" } },
    },
    config = function()
      require("mini.pick").setup()
      vim.ui.select = MiniPick.ui_select
    end,
  },
  {
    "echasnovski/mini.icons",
    version = false,
    enabled = vim.g.have_nerd_font,
  },
}
