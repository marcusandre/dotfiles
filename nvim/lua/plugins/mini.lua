return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- mini.ai
      local ai = require("mini.ai")

      ai.setup({
        custom_textobjects = {
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
        optione = {
          extra_ui = true,
        },
        mappings = {
          windows = true,
        },
      })

      vim.keymap.del("n", "<C-z>")

      -- mini.bracketed
      require("mini.bracketed").setup()

      -- mini.bufremove
      require("mini.bufremove").setup()

      vim.keymap.set("n", "<leader>q", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Buffer close" })
      vim.keymap.set("n", "<leader>Q", "<Cmd>bufdo lua MiniBufremove.delete()<CR>", { desc = "Buffer close (all)" })

      -- mini.clue
      local miniclue = require("mini.clue")
      miniclue.setup({
        clues = {
          -- EC.leader_group_clues,
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
      require("mini.comment").setup()

      -- mini.cursorword
      require("mini.cursorword").setup()

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

      -- mini.move
      require("mini.move").setup({ options = { reindent_linewise = false } })

      -- mini.pairs
      require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })

      -- mini.splitjoin
      require("mini.splitjoin").setup()

      -- mini.surround
      require("mini.surround").setup()

      -- mini.starter
      local MiniStarter = require("mini.starter")

      local header = function()
        local hour = tonumber(vim.fn.strftime("%H"))
        local part_id = math.floor((hour + 4) / 8) + 1
        local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]

        return ("Good %s!"):format(day_part)
      end

      MiniStarter.setup({
        items = {
          MiniStarter.sections.builtin_actions(),
          MiniStarter.sections.recent_files(5, true, false),
          MiniStarter.sections.recent_files(5, false, false),
          -- MiniStarter.sections.telescope(),
        },
        header = header,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          MiniStarter.config.footer = "Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(MiniStarter.refresh)
        end,
      })

      -- mini.statusline
      require("mini.statusline").setup()

      -- mini.tabline
      require("mini.tabline").setup()

      -- mini.trailspace
      require("mini.trailspace").setup()
    end,
  },
}
