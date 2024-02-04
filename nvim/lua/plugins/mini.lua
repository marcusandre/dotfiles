local utils = require('m.utils')

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
      { '<leader>bd', '<Cmd>lua MiniBufremove.delete()<CR>',         desc = 'Delete' },
      { '<leader>bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  desc = 'Delete!' },
      { '<leader>bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        desc = 'Wipeout' },
      { '<leader>bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', desc = 'Wipeout!' },
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
    'echasnovski/mini.extra',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.fuzzy',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.hues',
    version = false,
  },
  {
    'echasnovski/mini.move',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.pick',
    version = false,
    lazy = false,
    keys = {
      -- stylua: ignore start
      { '<leader>/',  '<Cmd>Pick grep_live<CR>',                         desc = 'Grep live' },
      { '<leader>f/', '<Cmd>Pick history scope="/"<CR>',                 desc = '"/" history' },
      { '<leader>f:', '<Cmd>Pick history scope=":"<CR>',                 desc = '":" history' },
      { '<leader>fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', desc = 'Added hunks (current)' },
      { '<leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>',          desc = 'Added hunks (all)' },
      { '<leader>fb', '<Cmd>Pick buffers<CR>',                           desc = 'Buffers' },
      { '<leader>fC', '<Cmd>Pick git_commits path="%"<CR>',              desc = 'Commits (current)' },
      { '<leader>fc', '<Cmd>Pick git_commits<CR>',                       desc = 'Commits (all)' },
      { '<leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>',            desc = 'Diagnostic workspace' },
      { '<leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>',        desc = 'Diagnostic buffer' },
      { '<leader>ff', '<Cmd>Pick files<CR>',                             desc = 'Files' },
      { '<leader>fG', utils.pick_file_changes_from_branch,               desc = 'Git changes (branch)' },
      { '<leader>fg', utils.pick_modified_untracked,                     desc = 'Git files' },
      { '<leader>fh', '<Cmd>Pick help<CR>',                              desc = 'Help tags' },
      { '<leader>fH', '<Cmd>Pick hl_groups<CR>',                         desc = 'Highlight groups' },
      { '<leader>fj', '<Cmd>Pick list scope="jump"<CR>',                 desc = 'Jumplist' },
      { '<leader>fl', '<Cmd>Pick buf_lines scope="all"<CR>',             desc = 'Lines (all)' },
      { '<leader>fL', '<Cmd>Pick buf_lines scope="current"<CR>',         desc = 'Lines (current)' },
      { '<leader>fM', '<Cmd>Pick git_hunks path="%"<CR>',                desc = 'Modified hunks (current)' },
      { '<leader>fm', '<Cmd>Pick git_hunks<CR>',                         desc = 'Modified hunks (all)' },
      { '<leader>fo', '<Cmd>Pick oldfiles<CR>',                          desc = 'Old files' },
      { '<leader>fr', '<Cmd>Pick lsp scope="references"<CR>',            desc = 'References (LSP)' },
      { '<leader>fR', '<Cmd>Pick resume<CR>',                            desc = 'Resume' },
      { '<leader>fS', '<Cmd>Pick lsp scope="document_symbol"<CR>',       desc = 'Symbols buffer (LSP)' },
      { '<leader>fs', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',      desc = 'Symbols workspace (LSP)' },
      { '<leader>fz', '<Cmd>Pick spellsuggest<CR>',                      desc = 'Spell suggest' },
      { 'gd',         '<Cmd>Pick lsp scope="definition"<CR>',            desc = 'Definition (LSP)' },
      { 'gI',         '<Cmd>Pick lsp scope="implementation"<CR>',        desc = 'Implementation (LSP)' },
      { 'gr',         '<Cmd>Pick lsp scope="references"<CR>',            desc = 'References (LSP)' },
      { 'gw',         '<Cmd>Pick grep pattern="<cword>"<CR>',            desc = 'Grep current word' },
      { 'gY',         '<Cmd>Pick lsp scope="type_definition"<CR>',       desc = 'Type Definition (LSP)' },
      -- stylua: ignore end
    },
    config = function()
      local MiniPick = require('mini.pick')
      MiniPick.setup()
      vim.ui.select = MiniPick.ui_select
    end,
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
