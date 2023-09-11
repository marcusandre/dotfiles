return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { "<leader>'", '<Cmd>Telescope resume<CR>',                        desc = 'Open last picker' },
      { '<leader>/', '<Cmd>Telescope live_grep<CR>',                     desc = 'Global search in workspace folder' },
      { '<leader>?', '<Cmd>Telescope commands<CR>',                      desc = 'Open command palette' },
      { '<leader>D', '<Cmd>Telescope diagnostics<CR>',                   desc = 'Open workspace diagnostic picker' },
      { '<leader>S', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Open workspace symbol picker' },
      { '<leader>b', '<Cmd>Telescope buffers<CR>',                       desc = 'Open buffer picker' },
      { '<leader>d', '<Cmd>Telescope diagnostics bufnr=0<CR>',           desc = 'Open diagnostic picker' },
      { '<leader>g', '<Cmd>Telescope git_status<cr>',                    desc = 'Open changed files' },
      { '<leader>f', '<Cmd>Telescope git_files<cr>',                     desc = 'Open file picker (git)' },
      { '<leader>F', '<Cmd>Telescope find_files<cr>',                    desc = 'Open file picker' },
      { '<leader>j', '<Cmd>Telescope jumplist<CR>',                      desc = 'Open jumplist picker' },
      { '<leader>o', '<Cmd>Telescope oldfiles<CR>',                      desc = 'Open old files' },
      { '<leader>s', '<Cmd>Telescope lsp_document_symbols<CR>',          desc = 'Open symbol picker' },
      { 'gD',        '<Cmd>Telescope lsp_type_definitions<CR>',          desc = 'Goto type definition' },
      { 'gd',        '<Cmd>Telescope lsp_definitions<CR>',               desc = 'Goto definition' },
      { 'gi',        '<Cmd>Telescope lsp_implementations<CR>',           desc = 'Goto implementation' },
      { 'gr',        '<Cmd>Telescope lsp_references<CR>',                desc = 'Goto references' },

      -- { '<leader>ft', '<Cmd>Telescope treesitter<CR>', desc = 'Find: treesitter' },
      -- { '<leader>fy', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Find: fuzzy search' },
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
