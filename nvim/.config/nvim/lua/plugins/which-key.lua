return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>o", group = "Other" },
    })

    return {
      icons = { mappings = false },
      preset = "helix",
    }
  end,
}
