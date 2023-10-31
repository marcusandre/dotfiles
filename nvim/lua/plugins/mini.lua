return {
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    config = function()
      local MiniStarter = require("mini.starter")

      local header = function()
        local hour = tonumber(vim.fn.strftime("%H"))
        local part_id = math.floor((hour + 4) / 8) + 1
        local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]

        return ("Good %s!"):format(day_part)
      end

      MiniStarter.setup({
        silent = true,
        items = {
          MiniStarter.sections.builtin_actions(),
          MiniStarter.sections.recent_files(5, true, false),
          MiniStarter.sections.recent_files(5, false, false),
        },
        header = header,
      })
    end,
  },
  {
    "echasnovski/mini.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      -- mini.ai
      local ai = require("mini.ai")

      ai.setup({
        custom_textobjects = {
          a = ai.gen_spec.treesitter({
            a = "@parameter.outer",
            i = "@parameter.inner",
          }),
          c = ai.gen_spec.treesitter({
            a = "@class.outer",
            i = "@class.inner",
          }),
          f = ai.gen_spec.treesitter({
            a = "@function.outer",
            i = "@function.inner",
          }),
          o = ai.gen_spec.treesitter({
            a = { "@conditional.outer", "@loop.outer" },
            i = { "@conditional.inner", "@loop.inner" },
          }),
        },
      })

      -- mini.align
      require("mini.align").setup()

      -- mini.basics
      require("mini.basics").setup({
        options = {
          extra_ui = true,
        },
        mappings = {
          option_toggle_prefix = [[\]],
          windows = true,
        },
      })

      vim.keymap.del("n", "<C-z>")

      -- mini.bracketed
      require("mini.bracketed").setup()

      -- mini.bufremove
      require("mini.bufremove").setup()

      -- mini.clue
      local miniclue = require("mini.clue")

      local leader_group_clues = {
        { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
        { mode = "n", keys = "<Leader>e", desc = "+Explore" },
        { mode = "n", keys = "<Leader>f", desc = "+Fuzzy" },
        { mode = "n", keys = "<Leader>g", desc = "+Git" },
        { mode = "n", keys = "<Leader>l", desc = "+LSP" },
        { mode = "n", keys = "<Leader>o", desc = "+Other" },
        { mode = "n", keys = "<Leader>p", desc = "+Pick" },
        { mode = "n", keys = "<Leader>t", desc = "+Terminal/Test" },
        { mode = "x", keys = "<Leader>l", desc = "+LSP" },
      }

      miniclue.setup({
        clues = {
          leader_group_clues,
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({ submode_resize = true }),
          miniclue.gen_clues.z(),
        },

        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- 'mini.bracketed'
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
          { mode = "x", keys = "[" },
          { mode = "x", keys = "]" },

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

        window = { config = { border = "double" } },
      })

      -- mini.comment
      -- require("mini.comment").setup()

      -- mini.cursorword
      require("mini.cursorword").setup()

      -- mini.files
      require("mini.files").setup()

      -- mini.hipatterns
      local hipatterns = require("mini.hipatterns")

      hipatterns.setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      -- mini.misc
      require("mini.misc").setup()

      -- mini.move
      require("mini.move").setup({ options = { reindent_linewise = false } })

      -- mini.pairs
      -- require("mini.pairs").setup()

      -- mini.pick
      require("mini.pick").setup({})

      -- mini.splitjoin
      require("mini.splitjoin").setup()

      -- mini.surround
      require("mini.surround").setup()

      -- mini.statusline
      require("mini.statusline").setup()

      -- mini.tabline
      require("mini.tabline").setup()

      -- mini.trailspace
      require("mini.trailspace").setup()
    end,
  },
}
