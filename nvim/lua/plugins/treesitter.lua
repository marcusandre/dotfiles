return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'css',
          'diff',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'html',
          'javascript',
          'json',
          'json5',
          'lua',
          'make',
          'markdown',
          'regex',
          'rust',
          'scss',
          'sql',
          'terraform',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'yaml',
        },
        autopairs = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then return true end
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-j>',
            node_incremental = '<C-j>',
            scope_incremental = '<C-j>',
            node_decremental = '<C-h>',
          },
        },
        -- swap = {
        --   enable = false,
        --   swap_next = {
        --     ['<leader>a'] = '@parameter.inner',
        --   },
        --   swap_previous = {
        --     ['<leader>A'] = '@parameter.inner',
        --   },
        -- },
      })
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
