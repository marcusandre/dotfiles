return {
  'kelly-lin/ranger.nvim',
  config = function()
    local ranger_nvim = require('ranger-nvim')

    ranger_nvim.setup({
      replace_netrw = true,
      keybinds = {
        ['ov'] = ranger_nvim.OPEN_MODE.vsplit,
        ['oh'] = ranger_nvim.OPEN_MODE.split,
        ['ot'] = ranger_nvim.OPEN_MODE.tabedit,
        ['or'] = ranger_nvim.OPEN_MODE.rifle,
      },
    })

    vim.api.nvim_set_keymap('n', '<leader>er', '', {
      desc = 'Explore: Files',
      noremap = true,
      callback = function() ranger_nvim.open(true) end,
    })
  end,
}
