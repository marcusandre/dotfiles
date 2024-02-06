return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      vim.defer_fn(function()
        local treesitter = require('nvim-treesitter.configs')

        -- stylua: ignore start
        local parsers = {
          'bash', 'comment', 'css', 'csv', 'diff', 'dockerfile', 'dot', 'fish',
          'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
          'go', 'gomod', 'gosum', 'gowork', 'hcl', 'html', 'http', 'javascript',
          'jq', 'jsdoc', 'json', 'jsonnet', 'lua', 'luadoc', 'make', 'markdown',
          'markdown_inline', 'nix', 'proto', 'r', 'rust', 'scss', 'sql', 'ssh_config',
          'terraform', 'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml',
        }
        -- stylua: ignore start

        treesitter.setup({
          ensure_installed = parsers,
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<c-space>',
              node_incremental = '<c-space>',
              scope_incremental = '<c-s>',
              node_decremental = '<M-space>',
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
              },
            },
            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                [']a'] = '@parameter.outer',
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
              },
              goto_next_end = {
                [']A'] = '@parameter.outer',
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
              },
              goto_previous_start = {
                ['[a'] = '@parameter.outer',
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
              },
              goto_previous_end = {
                ['[A'] = '@parameter.outer',
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
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
          },
        })
      end, 0)
    end,
  },
}
