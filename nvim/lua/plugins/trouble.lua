return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Trouble: Toggle" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble: Workspace" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Trouble: Document" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Trouble: Loclist" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Trouble: Quickfix" },
    { "gR",         "<cmd>TroubleToggle lsp_references<cr>",        desc = "Trouble: LSP References" },
  },
  config = function()
    require("trouble").setup({
      icons = false
    })
  end
}
