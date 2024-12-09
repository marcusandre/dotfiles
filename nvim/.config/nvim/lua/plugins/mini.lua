return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    keys = {
      -- mini.bufremove
      { "<leader>x", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "Close current buffer" },
    },
    config = function()
      require("mini.ai").setup()
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      require("mini.diff").setup()
      require("mini.extra").setup()
      require("mini.git").setup()
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.notify").setup()
      require("mini.statusline").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()
      require("mini.trailspace").setup()

      -- MiniBasics
      require("mini.basics").setup({
        options = { extra_ui = true },
      })

      -- MiniMisc
      local MiniMisc = require("mini.misc")

      MiniMisc.setup_auto_root()
      MiniMisc.setup_restore_cursor()
    end,
  },
  {
    "echasnovski/mini.pick",
    enabled = false,
    version = false,
    lazy = false,
    keys = {
      -- mini.pick
      { ",", "<Cmd>Pick buf_lines<CR>", desc = "Open buffer lines" },
      { "<leader>'", "<Cmd>Pick resume<CR>", desc = "Open last picker" },
      { "<leader>/", "<Cmd>Pick grep_live<CR>", desc = "Global search in workspace folder" },
      { "<leader>b", "<Cmd>Pick buffers<CR>", desc = "Open buffers picker" },
      { "<leader>f", "<Cmd>Pick files<CR>", desc = "Open files picker" },
      { "<leader>g", "<Cmd>Pick git_hunks<CR>", desc = "Open modified buffers" },
      { "<leader>h", "<Cmd>Pick help<CR>", desc = "Open help tags" },

      -- mini.pick (LSP)
      { "<leader>D", '<Cmd>Pick diagnostic scope="all"<CR>', desc = "Open workspace diagnostics picker (LSP)" },
      { "<leader>d", '<Cmd>Pick diagnostic scope="current"<CR>', desc = "Open document diagnostics picker (LSP)" },
      { "<space>s", '<Cmd>Pick lsp scope="document_symbol"<CR>', desc = "Go to document symbol (LSP)" },
      { "<space>S", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', desc = "Go to workspace symbol (LSP)" },
      { "gd", '<Cmd>Pick lsp scope="definition"<CR>', desc = "Go to definitions (LSP)" },
      { "gI", '<Cmd>Pick lsp scope="implementation"<CR>', desc = "Go to implementation (LSP)" },
      { "gr", '<Cmd>Pick lsp scope="references"<CR>', desc = "Go to references (LSP)" },
      { "gY", '<Cmd>Pick lsp scope="type_definition"<CR>', desc = "Go to type definitions (LSP)" },
    },
    config = function()
      -- MiniPick
      vim.ui.select = MiniPick.ui_select
    end,
  },
}
