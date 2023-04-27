return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>f/', '<Cmd>Telescope search_history<CR>', desc = '"/" history' },
      { '<leader>f:', '<Cmd>Telescope command_history<CR>', desc = 'Find: commands' },
      { '<leader>fB', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Find: open buffers' },
      { '<leader>fC', '<Cmd>Telescope git_bcommits<CR>', desc = 'Find: buffer commits' },
      { '<leader>fD', '<Cmd>Telescope diagnostics bufnr=0<CR>', desc = 'Find: diagnostic buffer' },
      { '<leader>fH', '<Cmd>Telescope highlights<CR>', desc = 'Find: highlight groups' },
      { '<leader>fO', '<Cmd>Telescope vim_options<CR>', desc = 'Find: options' },
      { '<leader>fR', '<Cmd>Telescope resume<CR>', desc = 'Find: resume' },
      { '<leader>fS', '<Cmd>Telescope treesitter<CR>', desc = 'Find: symbols (treesitter)' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Find: open buffers' },
      { '<leader>fc', '<Cmd>Telescope git_commits<CR>', desc = 'Find: commits' },
      { '<leader>fd', '<Cmd>Telescope diagnostics<CR>', desc = 'Find: diagnostic workspace' },
      { '<leader>ff', '<Cmd>Telescope find_files<cr>', desc = 'Find: files' },
      { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Find: grep search' },
      { '<leader>fh', '<Cmd>Telescope help_tags<CR>', desc = 'Find: help tags' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>', desc = 'Find: jumplist' },
      { '<leader>fo', '<Cmd>Telescope oldfiles<CR>', desc = 'Find: old files' },
      { '<leader>fr', '<Cmd>Telescope lsp_references<CR>', desc = 'Find: references (LSP)' },
      { '<leader>fs', '<Cmd>Telescope git_status<CR>', desc = 'Find: git status' },
      { 'gr', '<Cmd>Telescope lsp_references<CR>', desc = 'Find: references (LSP)' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local trouble = require('trouble.providers.telescope')
      local fuzzy = require('mini.fuzzy')

      telescope.setup({
        defaults = {
          border = true,
          sorting_strategy = 'ascending',
          layout_strategy = 'flex',
          layout_config = {
            prompt_position = 'top',
            vertical = { mirror = true },
            flex = { flip_columns = 140 },
          },
          file_sorter = fuzzy.get_telescope_sorter,
          generic_sorter = fuzzy.get_telescope_sorter,
          pickers = {
            buffers = { ignore_current_buffer = true },
          },
          mappings = {
            i = { ['<c-t>'] = trouble.open_with_trouble },
            n = { ['<c-t>'] = trouble.open_with_trouble },
          },
        },
      })
    end,
  },
}
