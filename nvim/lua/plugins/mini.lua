return {
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup({})
    end,
  },
  {
    "echasnovski/mini.bracketed",
    config = function()
      require("mini.bracketed").setup({})
    end,
  },
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({})
    end,
  },
  {
    "echasnovski/mini.completion",
    config = function()
      require("mini.completion").setup({})
    end,
  },
  {
    "echasnovski/mini.cursorword",
    config = function()
      require("mini.cursorword").setup({})
    end,
  },
  {
    "echasnovski/mini.misc",
    config = function()
      require("mini.misc").setup_restore_cursor()
    end,
  },
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup({})
    end,
  },
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup({})
    end,
  },
  {
    "echasnovski/mini.sessions",
    config = function()
      require("mini.sessions").setup({})
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    config = function()
      require("mini.splitjoin").setup({})
    end,
  },
  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup({})
    end,
  },
  {
    "echasnovski/mini.trailspace",
    config = function()
      require("mini.trailspace").setup({})
    end,
  },
  { "echasnovski/mini.base16" },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>q",  "<Cmd>lua MiniBufremove.delete()<CR>",         desc = "Buffer: Delete" },
      { "<leader>bw", "<Cmd>lua MiniBufremove.wipeout()<CR>",        desc = "Buffer: Wipeout" },
      { "<leader>bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", desc = "Buffer: Wipeout!" },
    },
    config = function()
      require("mini.bufremove").setup({})
    end,
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      local indentscope = require("mini.indentscope")

      indentscope.setup({ draw = { animation = indentscope.gen_animation.none() } })
    end,
  },
  {
    "echasnovski/mini.basics",
    config = function()
      local basics = require("mini.basics")

      basics.setup({
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'double',
        },
        mappings = {
          basic = true,
          move_with_alt = true,
        }
      })
    end,
  },
}
