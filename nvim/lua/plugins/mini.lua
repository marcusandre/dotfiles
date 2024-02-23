local utils = require('m.utils')

return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]parenthen
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup({
      n_lines = 500,
      custom_textobjects = {
        a = nil,
      },
    })

    -- Configurable Lua functions to go forward/backward to a certain target.
    require('mini.bracketed').setup()

    -- Unshow, delete, and wipeout buffer while saving window layout
    require('mini.bufremove').setup()

    -- stylua: ignore start
    vim.keymap.set('n', '<leader>ba', utils.delete_all_buffers, { desc = 'Delete (all)' })
    vim.keymap.set('n', '<leader>bd', utils.delete_buffer, { desc = 'Delete (current)' })
    vim.keymap.set('n', '<leader>bo', utils.delete_other_buffers, { desc = 'Delete (others)' })
    vim.keymap.set('n', '<leader>be', utils.open_scratch_buffer, { desc = 'Scratch buffer' })
    -- stylua: ignore end

    -- Move any selection in any direction
    require('mini.move').setup()

    -- Split and join arguments
    require('mini.splitjoin').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local MiniStarter = require('mini.starter')

    local header = function()
      local hour = tonumber(vim.fn.strftime('%H'))
      local part_id = math.floor((hour + 4) / 8) + 1
      local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]

      return ('Good %s!'):format(day_part)
    end

    MiniStarter.setup({
      silent = true,
      items = {
        MiniStarter.sections.builtin_actions(),
        MiniStarter.sections.recent_files(5, true, false),
        MiniStarter.sections.recent_files(5, false, false),
      },
      header = header,
    })

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    require('mini.statusline').setup()

    -- Trailspace (highlight and remove)
    require('mini.trailspace').setup()

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
