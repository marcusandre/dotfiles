return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
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
          enable = true
        },
        indent = {
          enable = true
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      })
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
