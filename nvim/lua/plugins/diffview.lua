local utils = require('m.utils')

return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gd', utils.diffview_toggle, desc = 'DiffView' },
  },
  opts = {},
}
