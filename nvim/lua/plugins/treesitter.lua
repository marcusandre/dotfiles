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
          'dockerfile',
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
          'nix',
          'python',
          'regex',
          'ruby',
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
        autopairs = { enable = true },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { 'python' } },
        -- textobjects = {
        --   select = {
        --     enable = true,
        --     lookahead = true,
        --     keymaps = {
        --       ['aa'] = '@parameter.outer',
        --       ['ia'] = '@parameter.inner',
        --       ['af'] = '@function.outer',
        --       ['if'] = '@function.inner',
        --       ['ac'] = '@class.outer',
        --       ['ic'] = '@class.inner',
        --       ["iB"] = "@block.inner",
        --       ["aB"] = "@block.outer",
        --     },
        --   },
        --   move = {
        --     enable = true,
        --     set_jumps = true,
        --     goto_next_start = {
        --       [']]'] = '@function.outer',
        --     },
        --     goto_next_end = {
        --       [']['] = '@function.outer',
        --     },
        --     goto_previous_start = {
        --       ['[['] = '@function.outer',
        --     },
        --     goto_previous_end = {
        --       ['[]'] = '@function.outer',
        --     },
        --   },
        --   swap = {
        --     enable = true,
        --     swap_next = {
        --       ['<leader>sn'] = '@parameter.inner',
        --     },
        --     swap_previous = {
        --       ['<leader>sp'] = '@parameter.inner',
        --     },
        --   },
        -- },
      })
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
