return {
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      local ai = require('mini.ai')

      ai.setup({
        custom_textobjects = {
          f = ai.gen_spec.treesitter({
            a = '@function.outer',
            i = '@function.inner',
          }),
          o = ai.gen_spec.treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          }),
        },
      })
    end,
  },
  {
    'echasnovski/mini.align',
    version = false,
    config = function()
      require('mini.align').setup()
    end,
  },
  {
    'echasnovski/mini.basics',
    version = false,
    config = function()
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

      vim.keymap.del('n', '<C-z>')
    end,
  },
  {
    'echasnovski/mini.bracketed',
    version = false,
    config = function()
      require('mini.bracketed').setup()
    end,
  },
  {
    'echasnovski/mini.bufremove',
    version = false,
    config = function()
      local map = require('utils').map

      require('mini.bufremove').setup()

      map('n', '<leader>bu', '<Cmd>lua MiniBufremove.unshow()<CR>', { desc = 'Buffer: Unshow' })
      map('n', '<leader>bU', '<Cmd>bufdo lua MiniBufremove.unshow()<CR>', { desc = 'Buffer: Unshow all' })
      map('n', '<leader>bd', '<Cmd>lua MiniBufremove.delete()<CR>', { desc = 'Buffer: Delete' })
      map('n', '<leader>bD', '<Cmd>bufdo lua MiniBufremove.delete()<CR>', { desc = 'Buffer: Delete all' })
      map('n', '<leader>bw', '<Cmd>lua MiniBufremove.wipeout()<CR>', { desc = 'Buffer: Wipeout' })
      map('n', '<leader>bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', { desc = 'Buffer: Wipeout!' })
    end,
  },
  {
    'echasnovski/mini.comment',
    version = false,
    config = function()
      require('mini.comment').setup()
    end,
  },
  {
    'echasnovski/mini.completion',
    version = false,
    config = function()
      require('mini.completion').setup({
        lsp_completion = {
          source_func = 'omnifunc',
        },
      })
    end,
  },
  {
    'echasnovski/mini.fuzzy',
    version = false,
    config = function()
      require('mini.fuzzy').setup()
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup()
    end,
  },
  {
    'echasnovski/mini.misc',
    version = false,
    config = function()
      require('mini.misc').setup()
    end,
  },
  {
    'echasnovski/mini.move',
    version = false,
    config = function()
      require('mini.move').setup()
    end,
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    config = function()
      require('mini.splitjoin').setup()
    end,
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      require('mini.statusline').setup()
    end,
  },
  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup()
    end,
  },
}
