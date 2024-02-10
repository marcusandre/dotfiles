return {
  {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      -- stylua: ignore start
      { '<leader>"',  '<Cmd>FzfLua live_grep_resume<CR>',            desc = 'Grep (resume)' },
      { '<leader>/',  '<Cmd>FzfLua live_grep_native<CR>',            desc = 'Grep' },
      { '<leader>:',  '<Cmd>FzfLua command_history<CR>',             desc = 'History' },
      { '<leader>?',  '<Cmd>FzfLua search_history<CR>',              desc = 'Search History' },
      { '<leader>fb', '<Cmd>FzfLua buffers<CR>',                     desc = 'Buffers' },
      { '<leader>fF', '<Cmd>FzfLua files<CR>',                       desc = 'Files (current)' },
      { '<leader>ff', '<Cmd>FzfLua git_files<CR>',                   desc = 'Files (all)' },
      { '<leader>fg', '<Cmd>FzfLua git_status<CR>',                  desc = 'Files (updated)' },
      { '<leader>fh', '<Cmd>FzfLua help_tags<CR>',                   desc = 'Help' },
      { '<leader>fk', '<Cmd>FzfLua keymaps<CR>',                     desc = 'Keymaps' },
      { '<leader>fL', '<Cmd>FzfLua blines<CR>',                      desc = 'Lines (current)' },
      { '<leader>fl', '<Cmd>FzfLua lines<CR>',                       desc = 'Lines (all)' },
      { '<leader>fo', '<Cmd>FzfLua oldfiles<CR>',                    desc = 'Recent Files' },
      { '<leader>fr', '<Cmd>FzfLua resume<CR>',                      desc = 'Resume' },
      { '<leader>fz', '<Cmd>FzfLua spell_suggest<CR>',               desc = 'Spelling' },
      { '<leader>la', '<Cmd>FzfLua lsp_code_actions<CR>',            desc = 'Code Actions' },
      { '<leader>lD', '<Cmd>FzfLua lsp_document_diagnostics<CR>',    desc = 'Diagnostics (current)' },
      { '<leader>ld', '<Cmd>FzfLua lsp_workspace_diagnostics<CR>',   desc = 'Diagnostics (all)' },
      { '<leader>li', '<Cmd>FzfLua lsp_implementations<CR>',         desc = 'Implementations' },
      { '<leader>lS', '<Cmd>FzfLua lsp_document_symbols<CR>',        desc = 'Symbols (current)' },
      { '<leader>ls', '<Cmd>FzfLua lsp_live_workspace_symbols	<CR>', desc = 'Symbols (all)' },
      { '<leader>ly', '<Cmd>FzfLua lsp_typedefs<CR>',     desc = 'Type Definitions' },
      { 'gD',         '<Cmd>FzfLua lsp_declarations<CR>', desc = 'Declarations' },
      { 'gd',         '<Cmd>FzfLua lsp_definitions<CR>',  desc = 'Definitions' },
      { 'gr',         '<Cmd>FzfLua lsp_references<CR>',   desc = 'References' },
      { 'gw',         '<Cmd>FzfLua grep_cWORD<CR>',       desc = 'Grep Word' },
      {
        '<leader>lv',
        function()
          require('fzf-lua').lsp_definitions({
            sync = true,
            jump_to_single_result = true,
            jump_to_single_result_action = require('fzf-lua.actions').file_vsplit,
          })
        end,
        desc = 'Type Definitions'
      },
      -- stylua: ignore end
    },
    config = function()
      local fzf = require('fzf-lua')

      fzf.setup({
        'fzf-native',
      })
      fzf.register_ui_select()
    end,
  },
}
