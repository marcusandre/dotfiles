return {
  "echasnovski/mini.nvim",
  version = false,
  lazy = false,
  keys = {
    -- mini.pick
    { "<leader>'", "<Cmd>Pick resume<CR>", desc = "Open last picker" },
    { "<leader>b", "<Cmd>Pick buffers<CR>", desc = "Open buffers picker" },
    { "<leader>f", "<Cmd>Pick files<CR>", desc = "Open files picker" },
    { "<leader>/", "<Cmd>Pick grep_live<CR>", desc = "Global search in workspace folder" },
    { "<leader>h", "<Cmd>Pick help<CR>", desc = "Open help tags" },
    { "<leader>d", "<Cmd>Pick diagnostic<CR>", desc = "Open diagnostics" },
    { "<leader>g", "<Cmd>Pick git_hunks<CR>", desc = "Open modified buffers" },
    { ",", "<Cmd>Pick buf_lines<CR>", desc = "Open buffer lines" },

    -- mini.bufremove
    { "<leader>x", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "Close current buffer" },
  },
  config = function()
    require("mini.ai").setup()
    require("mini.basics").setup({ extra_ui = true })
    require("mini.bracketed").setup()
    require("mini.bufremove").setup()
    require("mini.completion").setup()
    require("mini.cursorword").setup()
    require("mini.diff").setup()
    require("mini.extra").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.pick").setup()
    require("mini.splitjoin").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.tabline").setup()
    require("mini.trailspace").setup()
  end,
}
