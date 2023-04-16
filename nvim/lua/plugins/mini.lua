return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    local map = require("utils").map

    require("mini.ai").setup()
    require("mini.align").setup()
    -- require('mini.animate').setup()
    -- require('mini.base16').setup()
    require("mini.basics").setup({
      options = {
        basic = true,
        extra_ui = true,
        win_borders = "default",
      },
      mappings = {
        basic = true,
        option_toggle_prefix = [[\]],
        windows = false,
        move_with_alt = true,
      },
      autocommands = {
        basic = true,
        relnum_in_visual_mode = true,
      },
    })
    require("mini.bracketed").setup()

    -- bufremove
    require("mini.bufremove").setup()
    map("n", "<leader>bq", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Buffer: Delete" })
    map("n", "<leader>bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", { desc = "Buffer: Wipeout" })
    map("n", "<leader>bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", { desc = "Buffer: Wipeout!" })

    require("mini.comment").setup()
    require("mini.completion").setup()
    require("mini.cursorword").setup()
    -- require('mini.doc').setup()

    require("mini.fuzzy").setup()

    require("mini.indentscope").setup()
    require("mini.jump").setup()
    require("mini.jump2d").setup()
    -- require('mini.map').setup()

    require("mini.misc").setup()
    require("mini.misc").setup_restore_cursor()

    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.sessions").setup()
    require("mini.splitjoin").setup()
    require("mini.starter").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.tabline").setup()
    -- require('mini.test').setup()
    require("mini.trailspace").setup()
  end,
}
