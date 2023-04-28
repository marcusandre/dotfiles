return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup({
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>{', '<Cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>}', '<Cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    })
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
  end,
}
