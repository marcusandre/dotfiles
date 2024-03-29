return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'nushell/tree-sitter-nu',
    },
    build = ':TSUpdate',
    config = function()
      local ensure_installed = {
        'bash',
        'comment',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'dot',
        'fish',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'hcl',
        'html',
        'http',
        'javascript',
        'jq',
        'jsdoc',
        'json',
        'jsonnet',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'nix',
        'ocaml',
        'ocaml_interface',
        'proto',
        'r',
        'rust',
        'scss',
        'sql',
        'ssh_config',
        'terraform',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      }

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        ensure_installed = ensure_installed,
        auto_install = true,
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
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
        },
        textobjects = {
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
    end,
  },
}
