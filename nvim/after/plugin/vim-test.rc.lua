local coverage = require('coverage')
local keymap = vim.keymap

coverage.setup({
  -- configuration options here
  highlights = {
    -- customize highlights
  },
  signs = {
    -- customize signs
  },
  summary = {
    -- customize summary pop-up
  },
  lang = {
    -- customize langauge specific settings
  }
})

keymap.set('n', '<leader>tf', ':TestFile<CR>');
keymap.set('n', '<leader>tn', ':TestNearest<CR>');
keymap.set('n', '<leader>tl', ':TestLast<CR>');
keymap.set('n', '<leader>tv', ':TestVisit<CR>');
