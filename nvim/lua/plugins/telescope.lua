return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>f,', '<Cmd>Telescope spell_suggest<CR>', desc = 'Find: spell suggest' },
      { '<leader>f/', '<Cmd>Telescope search_history<CR>', desc = '"/" history' },
      { '<leader>f:', '<Cmd>Telescope command_history<CR>', desc = 'Find: commands' },
      { '<leader>fF', '<Cmd>Telescope find_files<cr>', desc = 'Find: files' },
      { '<leader>fO', '<Cmd>Telescope vim_options<CR>', desc = 'Find: options' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Find: open buffers' },
      { '<leader>fc', '<Cmd>Telescope git_commits<CR>', desc = 'Find: commits' },
      { '<leader>ff', '<Cmd>Telescope git_files<cr>', desc = 'Find: git files' },
      { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Find: grep search' },
      { '<leader>fh', '<Cmd>Telescope help_tags<CR>', desc = 'Find: help tags' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>', desc = 'Find: jumplist' },
      { '<leader>fo', '<Cmd>Telescope oldfiles<CR>', desc = 'Find: old files' },
      { '<leader>fr', '<Cmd>Telescope resume<CR>', desc = 'Find: resume' },
      { '<leader>fs', '<Cmd>Telescope git_status<CR>', desc = 'Find: git status' },
      { '<leader>ft', '<Cmd>Telescope treesitter<CR>', desc = 'Find: treesitter' },
      { '<leader>fy', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Find: fuzzy search' },
      { '<leader>lD', '<Cmd>Telescope diagnostics<CR>', desc = 'Find: diagnostics (workspace)' },
      { '<leader>lS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Find: symbols (workspace)' },
      { '<leader>ld', '<Cmd>Telescope diagnostics bufnr=0<CR>', desc = 'Find: diagnostics (buffer)' },
      { '<leader>ls', '<Cmd>Telescope lsp_document_symbols<CR>', desc = 'Find: symbols (document)' },
      { 'gD', '<Cmd>Telescope lsp_type_definitions<CR>', desc = 'Find: definitions (LSP)' },
      { 'gd', '<Cmd>Telescope lsp_definitions<CR>', desc = 'Find: definitions (LSP)' },
      { 'gi', '<Cmd>Telescope lsp_implementations<CR>', desc = 'Find: references (LSP)' },
      { 'gr', '<Cmd>Telescope lsp_references<CR>', desc = 'Find: references (LSP)' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require('telescope')
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
        },
        pickers = {
          buffers = { theme = 'dropdown' },
          lsp_references = { theme = 'dropdown' },
          git_status = { theme = 'dropdown' },
        },
      })
    end,
  },
}
