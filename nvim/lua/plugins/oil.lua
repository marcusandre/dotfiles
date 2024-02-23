return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>e', '<Cmd>Oil<CR>', desc = 'Oil' },
  },
  config = function()
    local oil = require('oil')

    oil.setup({
      default_file_explorer = true,
      delete_to_trash = false,
      lsp_rename_autosave = true,
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
