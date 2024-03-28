return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    -- stylua: ignore start
    { '<leader>gA', '<Cmd>lua require("gitsigns").stage_buffer()<CR>',              desc = 'Add buffer' },
    { '<leader>ga', '<Cmd>lua require("gitsigns").stage_hunk()<CR>',                desc = 'Add (stage) hunk' },
    { '<leader>gb', '<Cmd>lua require("gitsigns").blame_line()<CR>',                desc = 'Blame line' },
    { '<leader>gB', '<Cmd>lua require("gitsigns").toggle_current_line_blame()<CR>', desc = 'Toggle line blame' },
    { '<leader>gP', '<Cmd>lua require("gitsigns").preview_hunk()<CR>',              desc = 'Preview hunk (float)' },
    { '<leader>gp', '<Cmd>lua require("gitsigns").preview_hunk_inline()<CR>',       desc = 'Preview hunk' },
    { '<leader>gq', '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>',       desc = 'Quickfix hunks' },
    { '<leader>gu', '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>',           desc = 'Undo stage hunk' },
    { '<leader>gX', '<Cmd>lua require("gitsigns").reset_buffer()<CR>',              desc = 'Discard buffer' },
    { '<leader>gx', '<Cmd>lua require("gitsigns").reset_hunk()<CR>',                desc = 'Discard hunk' },
    { '[h',         '<Cmd>Gitsigns prev_hunk<CR>zvzz',                              desc = 'Goto previous hunk' },
    { ']h',         '<Cmd>Gitsigns next_hunk<CR>zvzz',                              desc = 'Goto next hunk' },
    -- stylua: ignore end
  },
  opts = {
    signs = {
      add = { text = '▒' },
      change = { text = '▒' },
      changedelete = { text = '▓' },
      delete = { text = '▓' },
      topdelete = { text = '▓' },
      untracked = { text = '░' },
    },
  },
}
