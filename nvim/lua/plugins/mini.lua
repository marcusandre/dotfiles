return {
  {
    'echasnovski/mini.base16',
    version = false,
  },
  {
    'echasnovski/mini.basics',
    version = false,
    opts = {
      options = {
        extra_ui = true,
      },
      mappings = {
        basics = true,
        windows = true,
      },
      autocommands = {
        basic = true,
      },
    },
  },
  {
    'echasnovski/mini.bracketed',
    version = false,
    opts = {
      treesitter = { suffix = '' },
    },
  },
  {
    'echasnovski/mini.bufremove',
    version = false,
    keys = {
      -- stylua: ignore start
      { '<leader><leader>', '<Cmd>b#<CR>',                                 desc = 'Delete' },
      { '<leader>bd',       '<Cmd>lua MiniBufremove.delete()<CR>',         desc = 'Delete' },
      { '<leader>bD',       '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  desc = 'Delete!' },
      { '<leader>bw',       '<Cmd>lua MiniBufremove.wipeout()<CR>',        desc = 'Wipeout' },
      { '<leader>bW',       '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', desc = 'Wipeout!' },
      -- stylua: ignore end
    },
    opts = {},
  },
  {
    'echasnovski/mini.completion',
    version = false,
    opts = {
      lsp_completion = {
        source_func = 'omnifunc',
      },
    },
  },
  {
    'echasnovski/mini.cursorword',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.move',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.starter',
    version = false,
    config = function()
      local MiniStarter = require('mini.starter')

      local header = function()
        local hour = tonumber(vim.fn.strftime('%H'))
        local part_id = math.floor((hour + 4) / 8) + 1
        local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]

        return ('Good %s!'):format(day_part)
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
    'echasnovski/mini.statusline',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.tabline',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.trailspace',
    version = false,
    opts = {},
  },
}
