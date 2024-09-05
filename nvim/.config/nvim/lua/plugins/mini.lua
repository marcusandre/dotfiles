return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.bufremove").setup()
    require("mini.notify").setup()

    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
        { mode = "n", keys = "<Leader>e", desc = "+Explore" },
        { mode = "n", keys = "<Leader>f", desc = "+Fuzzy" },
        { mode = "n", keys = "<Leader>g", desc = "+Git" },
        { mode = "n", keys = "<Leader>h", desc = "+Hunks" },
        { mode = "n", keys = "<Leader>l", desc = "+LSP" },
        { mode = "n", keys = "<Leader>o", desc = "+Other/Toggle" },
      },
    })
  end,
}
