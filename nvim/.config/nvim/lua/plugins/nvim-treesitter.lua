return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    { "windwp/nvim-ts-autotag", opts = {} },
  },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ensure_installed = {
      "comment",
      "diff",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "hcl",
      "json",
      "json5",
      "jsonc",
      "just",
      "lua",
      "markdown",
      "markdown_inline",
      "nix",
      "ron",
      "rust",
      "terraform",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "zig",
    }

    local should_disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      ---@diagnostic disable-next-line: undefined-field
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then return true end
    end

    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = ensure_installed,
      endwise = true,
      highlight = { enable = true, should_disable = should_disable },
      indent = { enable = true, align = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-.>",
          node_incremental = "<C-.>",
          scope_incremental = nil,
          node_decremental = "<C-,>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>]"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>["] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
