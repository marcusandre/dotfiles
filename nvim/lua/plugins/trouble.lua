return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      -- stylua: ignore start
      { '<leader>xx', function() require('trouble').toggle() end, desc = 'Toggle' },
      { '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, desc = 'Diagnostics (all)' },
      { '<leader>xd', function() require('trouble').toggle('document_diagnostics') end, desc = 'Diagnostics (current)' },
      { '<leader>xq', function() require('trouble').toggle('quickfix') end, desc = 'Quickfix' },
      { '<leader>xl', function() require('trouble').toggle('loclist') end, desc = 'Loclist' },
      -- stylua: ignore end
    },
    opts = {},
  },
}
