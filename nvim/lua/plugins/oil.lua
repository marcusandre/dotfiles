return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>e', '<Cmd>Oil<CR>', desc = 'Oil' },
  },
  config = function()
    require('oil').setup({
      default_file_explorer = true,
      delete_to_trash = true,
      lsp_file_methods = {
        lsp_rename_autosave = true,
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
