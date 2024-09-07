return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>e", group = "Explore" },
      { "<leader>f", group = "Fuzzy" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>o", group = "Other" },
      { "<leader>t", group = "Test" },
    })

    return { preset = "helix" }
  end,
}
