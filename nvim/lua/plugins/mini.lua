return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local map = require('utils').map

    require('mini.basics').setup({
      options = {
        basic = true,
        extra_ui = true,
        win_borders = 'default',
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

    local spec_treesitter = require('mini.ai').gen_spec.treesitter

    require('mini.ai').setup({
      custom_textobjects = {
        F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
        o = spec_treesitter({
          a = { '@conditional.outer', '@loop.outer' },
          i = { '@conditional.inner', '@loop.inner' },
        }),
      },
    })

    require('mini.completion').setup({
      lsp_completion = {
        source_func = 'omnifunc',
      },
    })

    require('mini.bufremove').setup()
    require('mini.align').setup()
    require('mini.bracketed').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.fuzzy').setup()
    require('mini.indentscope').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.misc').setup()
    require('mini.misc').setup_restore_cursor()
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.sessions').setup()
    require('mini.splitjoin').setup()
    require('mini.starter').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()
    require('mini.tabline').setup()
    require('mini.trailspace').setup()
    -- require('mini.base16').setup()
    -- require('mini.animate').setup()

    map('n', '<leader>bq', '<Cmd>lua MiniBufremove.delete()<CR>', { desc = 'Buffer: Delete' })
    map('n', '<leader>bw', '<Cmd>lua MiniBufremove.wipeout()<CR>', { desc = 'Buffer: Wipeout' })
    map('n', '<leader>bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', { desc = 'Buffer: Wipeout!' })
    vim.keymap.del('n', '<C-z>')
  end,
}
