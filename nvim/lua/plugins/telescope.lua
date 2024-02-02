local utils = require('m.utils')

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
    },
    keys = {
      -- stylua: ignore start
      { ',',          '<Cmd>Telescope current_buffer_fuzzy_find<CR>',     desc = 'Buffer lines' },
      { '<leader>/',  '<Cmd>Telescope live_grep<CR>',                     desc = 'Grep' },
      { '<leader>:',  '<Cmd>Telescope command_history<CR>',               desc = 'History (commands)' },
      { '<leader>?',  '<Cmd>Telescope search_history<CR>',                desc = 'History (search)' },
      { '<leader>fb', '<Cmd>Telescope buffers<CR>',                       desc = 'Buffers' },
      { '<leader>fd', '<Cmd>Telescope diagnostics bufnr=0<CR>',           desc = 'Diagnostics (Workspace)' },
      { '<leader>fD', '<Cmd>Telescope diagnostics<CR>',                   desc = 'Diagnostics (Workspace)' },
      { '<leader>ff', utils.project_files,                                desc = 'Files' },
      { '<leader>fG', '<Cmd>Telescope git_bcommits<CR>',                  desc = 'Git commits' },
      { '<leader>fg', '<Cmd>Telescope git_status<CR>',                    desc = 'Git status' },
      { '<leader>fh', '<Cmd>Telescope help_tags<CR>',                     desc = 'Help' },
      { '<leader>fj', '<Cmd>Telescope jumplist<CR>',                      desc = 'Jumplist' },
      { '<leader>fk', '<Cmd>Telescope keymaps<CR>',                       desc = 'Keymaps' },
      { '<leader>fo', '<Cmd>Telescope oldfiles<CR>',                      desc = 'Oldfiles' },
      { '<leader>fO', '<Cmd>Telescope vim_options<CR>',                   desc = 'Options' },
      { '<leader>fr', '<Cmd>Telescope resume<CR>',                        desc = 'Resume' },
      { '<leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>',          desc = 'Symbols' },
      { '<leader>fS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Symbols (Workspace)' },
      { '<leader>ft', '<Cmd>Telescope treesitter<CR>',                    desc = 'Treesitter' },
      { 'gd',         '<Cmd>Telescope lsp_definitions<CR>',               desc = 'Definition (LSP)' },
      { 'gi',         '<Cmd>Telescope lsp_implementations<CR>',           desc = 'Implementation (LSP)' },
      { 'gl',         '<Cmd>Telescope lsp_type_definitions<CR>',          desc = 'Type definition (LSP)' },
      { 'gr',         '<Cmd>Telescope lsp_references<CR>',                desc = 'References (LSP)' },
      { 'gw',         '<Cmd>Telescope grep_string<CR>',                   desc = 'Grep word (LSP)' },
      -- stylua: ignore end
    },
    config = function()
      local telescope = require('telescope')
      local trouble = require('trouble.providers.telescope')

      telescope.setup({
        defaults = {
          mappings = {
            i = { ['<c-t>'] = trouble.open_with_trouble },
            n = { ['<c-t>'] = trouble.open_with_trouble },
          },
        },
      })
    end,
  },
}
