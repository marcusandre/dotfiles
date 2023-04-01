return {
  -- echasnovski/mini
  { 'echasnovski/mini.ai',         version = "false", config = function() require("mini.ai").setup({}) end },
  { 'echasnovski/mini.bracketed',  version = "false", config = function() require("mini.bracketed").setup({}) end },
  { 'echasnovski/mini.bufremove',  version = "false", config = function() require("mini.bufremove").setup({}) end },
  { 'echasnovski/mini.comment',    version = "false", config = function() require("mini.comment").setup({}) end },
  { 'echasnovski/mini.completion', version = "false", config = function() require("mini.completion").setup({}) end },
  { 'echasnovski/mini.cursorword', version = "false", config = function() require("mini.cursorword").setup({}) end },
  { 'echasnovski/mini.move',       version = "false", config = function() require("mini.move").setup({}) end },
  { 'echasnovski/mini.pairs',      version = "false", config = function() require("mini.pairs").setup({}) end },
  { 'echasnovski/mini.sessions',   version = "false", config = function() require("mini.sessions").setup({}) end },
  { 'echasnovski/mini.splitjoin',  version = "false", config = function() require("mini.splitjoin").setup({}) end },
  { 'echasnovski/mini.statusline', version = "false", config = function() require("mini.statusline").setup({}) end },
  { 'echasnovski/mini.surround',   version = "false", config = function() require("mini.surround").setup({}) end },
  { 'echasnovski/mini.trailspace', version = "false", config = function() require("mini.trailspace").setup({}) end },
  { 'echasnovski/mini.base16',     version = "false" },
  {
    'echasnovski/mini.indentscope',
    version = "false",
    config = function()
      local indentscope = require('mini.indentscope')

      indentscope.setup({ draw = { animation = indentscope.gen_animation.none() } })
    end
  },
}
