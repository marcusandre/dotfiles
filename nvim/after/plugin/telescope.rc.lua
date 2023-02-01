local ok, telescope = pcall(require, "telescope")
if (not ok) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- Setup
telescope.setup({
  defaults = {},
  mappings = {
    n = {
      ['q'] = actions.close,
    },
  },
  pickers = {
    buffers = { theme = 'dropdown' },
    oldfiles = { theme = 'dropdown' },
    current_buffer_fuzzy_find = { theme = 'dropdown' },
  },
})

-- Keymaps
local bufopts = { noremap = true, silent = true, }

vim.keymap.set('n', '<leader>ff', function()
  local opts = {
    hidden = true,
    no_ignore = false,
  }
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end, bufopts)

vim.keymap.set('n', '<leader>fv', function()
  builtin.find_files(themes.get_dropdown {
    hidden = true,
    no_ignore = false,
    previewer = false,
    search_dirs = { "$HOME/.dotfiles/nvim/" },
  })
end, bufopts)

vim.keymap.set('n', '<leader>fy', function()
	builtin.current_buffer_fuzzy_find({
    skip_empty_lines = true,
  })
end)

vim.keymap.set('n', '<leader>fb', builtin.buffers, {}, bufopts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}, bufopts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}, bufopts)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {}, bufopts)
vim.keymap.set('n', '<leader>fr', builtin.resume, bufopts)
vim.keymap.set('n', '<leader>fs', builtin.git_status, {}, bufopts)
vim.keymap.set('n', 'gs', builtin.grep_string, {}, bufopts)

-- LSP Keymaps
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, bufopts)
vim.keymap.set('n', '<leader>d', builtin.diagnostics, bufopts)
vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
