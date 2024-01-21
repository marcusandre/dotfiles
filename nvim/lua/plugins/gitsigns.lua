return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      -- stylua: ignore start
      { '<leader>gA', '<Cmd>lua require("gitsigns").stage_buffer()<CR>',              desc = 'Add buffer' },
      { '<leader>ga', '<Cmd>lua require("gitsigns").stage_hunk()<CR>',                desc = 'Add (stage) hunk' },
      { '<leader>gb', '<Cmd>lua require("gitsigns").blame_line()<CR>',                desc = 'Blame line' },
      { '<leader>gB', '<Cmd>lua require("gitsigns").toggle_current_line_blame()<CR>', desc = 'Toggle line blame' },
      { '<leader>gp', '<Cmd>lua require("gitsigns").preview_hunk()<CR>',              desc = 'Preview hunk' },
      { '<leader>gq', '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>',       desc = 'Quickfix hunks' },
      { '<leader>gu', '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>',           desc = 'Undo stage hunk' },
      { '<leader>gX', '<Cmd>lua require("gitsigns").reset_buffer()<CR>',              desc = 'Discard buffer' },
      { '<leader>gx', '<Cmd>lua require("gitsigns").reset_hunk()<CR>',                desc = 'Discard hunk' },
      { '[h',         '<Cmd>Gitsigns prev_hunk<CR>zvzz',                              desc = 'Goto previous hunk' },
      { ']h',         '<Cmd>Gitsigns next_hunk<CR>zvzz',                              desc = 'Goto next hunk' },
      -- stylua: ignore end
    },
    opts = {
      max_file_length = 100000,
      numhl = false,
      linehl = false,
      watch_gitdir = { interval = 1000 },
      current_line_blame = false,
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      current_line_blame_opts = {
        delay = 50,
      },
    },
  },
}
