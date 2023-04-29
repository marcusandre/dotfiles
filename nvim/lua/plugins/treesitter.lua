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
          'bash',
          'c',
          'cpp',
          'css',
          'diff',
          'dockerfile',
          'dot',
          'fish',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'html',
          'http',
          'java',
          'javascript',
          'jq',
          'json',
          'json5',
          'lua',
          'make',
          'markdown',
          'nix',
          'php',
          'python',
          'query',
          'r',
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
        highlight = { enable = true },
        indent = { enable = true, disable = { 'python' } },
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then return true end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
