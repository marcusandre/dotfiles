return {
  { 'echasnovski/mini.ai',         config = function() require("mini.ai").setup({}) end },
  { 'echasnovski/mini.bracketed',  config = function() require("mini.bracketed").setup({}) end },
  { 'echasnovski/mini.bufremove',  config = function() require("mini.bufremove").setup({}) end },
  { 'echasnovski/mini.comment',    config = function() require("mini.comment").setup({}) end },
  { 'echasnovski/mini.completion', config = function() require("mini.completion").setup({}) end },
  { 'echasnovski/mini.cursorword', config = function() require("mini.cursorword").setup({}) end },
  { 'echasnovski/mini.move',       config = function() require("mini.move").setup({}) end },
  { 'echasnovski/mini.pairs',      config = function() require("mini.pairs").setup({}) end },
  { 'echasnovski/mini.sessions',   config = function() require("mini.sessions").setup({}) end },
  { 'echasnovski/mini.splitjoin',  config = function() require("mini.splitjoin").setup({}) end },
  { 'echasnovski/mini.statusline', config = function() require("mini.statusline").setup({}) end },
  { 'echasnovski/mini.trailspace', config = function() require("mini.trailspace").setup({}) end },
  { 'echasnovski/mini.base16', },
  {
    'echasnovski/mini.indentscope',
    config = function()
      local indentscope = require('mini.indentscope')

      indentscope.setup({ draw = { animation = indentscope.gen_animation.none() } })
    end
  },
}
