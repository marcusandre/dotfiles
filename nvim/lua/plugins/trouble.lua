return {
  'folke/trouble.nvim',
  keys = {
    { '<leader>xx', '<cmd>troubletoggle<cr>', desc = 'trouble: toggle' },
    { '<leader>xw', '<cmd>troubletoggle workspace_diagnostics<cr>', desc = 'trouble: workspace' },
    { '<leader>xd', '<cmd>troubletoggle document_diagnostics<cr>', desc = 'trouble: document' },
    { '<leader>xl', '<cmd>troubletoggle loclist<cr>', desc = 'trouble: loclist' },
    { '<leader>xq', '<cmd>troubletoggle quickfix<cr>', desc = 'trouble: quickfix' },
    { '<leader>xr', '<cmd>troubletoggle lsp_references<cr>', desc = 'trouble: lsp references' },
  },
  config = function()
    require('trouble').setup({
      icons = false,
    })
  end,
}
