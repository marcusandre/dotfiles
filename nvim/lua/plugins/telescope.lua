return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      -- stylua: ignore start
      { "<leader>'", '<Cmd>Telescope resume<CR>',                        desc = 'Open last picker' },
      { '<leader>/', '<Cmd>Telescope live_grep<CR>',                     desc = 'Global search in workspace folder' },
      { '<leader>:', '<Cmd>Telescope command_history<CR>',               desc = 'Open command history' },
      { '<leader>D', '<Cmd>Telescope diagnostics<CR>',                   desc = 'Open workspace diagnostic picker' },
      { '<leader>F', '<Cmd>Telescope find_files<cr>',                    desc = 'Open file picker' },
      { '<leader>S', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Open workspace symbol picker' },
      { '<leader>b', '<Cmd>Telescope buffers<CR>',                       desc = 'Open buffer picker' },
      { '<leader>d', '<Cmd>Telescope diagnostics bufnr=0<CR>',           desc = 'Open diagnostic picker' },
      { '<leader>f', '<Cmd>Telescope git_files<cr>',                     desc = 'Open file picker (git)' },
      { '<leader>g', '<Cmd>Telescope git_status<cr>',                    desc = 'Open changed files' },
      { '<leader>h', '<Cmd>Telescope help_tags<cr>',                     desc = 'Open help tags' },
      { '<leader>i', '<Cmd>Telescope current_buffer_fuzzy_find<CR>',     desc = 'Open buffer fuzzy search' },
      { '<leader>j', '<Cmd>Telescope jumplist<CR>',                      desc = 'Open jumplist picker' },
      { '<leader>l', '<Cmd>Telescope treesitter<CR>',                    desc = 'Open buffer treesitter search' },
      { '<leader>o', '<Cmd>Telescope oldfiles<CR>',                      desc = 'Open old files' },
      { '<leader>s', '<Cmd>Telescope lsp_document_symbols<CR>',          desc = 'Open symbol picker' },
      { 'g/',        '<Cmd>Telescope grep_string<CR>',                   desc = 'Global search word under cursor' },
      { 'gD',        '<Cmd>Telescope lsp_type_definitions<CR>',          desc = 'Goto type definition' },
      { 'gd',        '<Cmd>Telescope lsp_definitions<CR>',               desc = 'Goto definition' },
      { 'gi',        '<Cmd>Telescope lsp_implementations<CR>',           desc = 'Goto implementation' },
      { 'gr',        '<Cmd>Telescope lsp_references<CR>',                desc = 'Goto references' },
      -- stylua: ignore end
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
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
          lsp_definitions = { theme = 'ivy' },
          lsp_document_symbols = { theme = 'ivy' },
          lsp_dynamic_workspace_symbols = { theme = 'ivy' },
          lsp_implementations = { theme = 'ivy' },
          lsp_references = { theme = 'ivy' },
          lsp_type_definitions = { theme = 'ivy' },
          find_files = {
            find_command = vim.fn.executable('fdfind') == 1 and { 'fdfind', '--strip-cwd-prefix', '--type', 'f' }
              or nil,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })

      require('telescope').load_extension('ui-select')
    end,
  },
}
