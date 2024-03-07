return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable('make') == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    local themes = require('telescope.themes')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        },
      },
      pickers = {
        buffers = {
          theme = 'dropdown',
          ignore_current_buffer = true,
          sort_mru = true,
        },
        lsp_definitions = {
          show_line = false,
        },
        lsp_references = {
          show_line = false,
        },
        lsp_implementations = {
          show_line = false,
        },
        lsp_type_definitions = {
          show_line = false,
        },
        lsp_document_symbols = {
          fname_width = 0,
        },
        lsp_dynamic_workspace_symbols = {
          fname_width = 0,
        },
        git_status = {
          theme = 'dropdown',
        },
      },
      extensions = {
        ['ui-select'] = { themes.get_dropdown() },
      },
    })

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Grep (live)' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Colorscheme' })
    vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Files' })
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Files (git)' })
    vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Files (changed)' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Files (old)' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume' })
    vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Builtins' })
    vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', 'gw', builtin.grep_string, { desc = 'Grep (string)' })

    vim.keymap.set(
      'n',
      ',',
      function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      { desc = '[/] Fuzzily search in current buffer' }
    )

    vim.keymap.set(
      'n',
      '<leader>f/',
      function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end,
      { desc = 'Grep (open files)' }
    )

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set(
      'n',
      '<leader>fn',
      function() builtin.find_files({ cwd = '~/.dotfiles/nvim' }) end,
      { desc = 'Configuration' }
    )

    -- Shortcut for searching my Obsidian vault
    vim.keymap.set(
      'n',
      '<leader>fm',
      function() builtin.find_files({ cwd = '~/src/projects/github.com/marcusandre/obsidian' }) end,
      { desc = 'Find Obsidian Documents' }
    )
  end,
}
