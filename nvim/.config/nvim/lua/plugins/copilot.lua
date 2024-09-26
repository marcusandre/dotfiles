return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require("copilot").setup() end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    build = "make tiktoken",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>cc", "<Cmd>CopilotChatToggle<CR>", desc = "Open copilot chat", mode = { "n", "v" } },
      { "<leader>ce", "<Cmd>CopilotChatExplain<CR>", desc = "Open copilot explain panel", mode = { "n", "v" } },
      { "<leader>cf", "<Cmd>CopilotChatFix<CR>", desc = "Open copilot fix panel", mode = { "n", "v" } },
      { "<leader>cg", "<Cmd>CopilotChatCommit<CR>", desc = "Open copilot commit panel", mode = { "n", "v" } },
    },
    opts = {},
  },
}
