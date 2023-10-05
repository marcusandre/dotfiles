return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      -- "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local ts = require("nvim-treesitter.configs")
      require("ts_context_commentstring").setup({})

      require("nvim-treesitter.install").prefer_git = true

      ---@diagnostic disable-next-line: missing-fields
      ts.setup({
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
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-m>",
            node_incremental = "<C-m>",
            scope_incremental = "<C-m>",
            node_decremental = "<C-n>",
          },
        },
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ["<leader>m"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>M"] = "@parameter.inner",
            },
          },
        },
        playground = {
          enable = true,
          updatetime = 25,
          persist_queries = false,
        },
        ensure_installed = {
          "bash",
          "css",
          "diff",
          "elixir",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "html",
          "javascript",
          "json",
          "json5",
          "lua",
          "make",
          "markdown",
          "regex",
          "rust",
          "scss",
          "sql",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "zig",
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground",
  },
}
