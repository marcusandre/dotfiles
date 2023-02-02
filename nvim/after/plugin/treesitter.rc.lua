local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if (not ok) then return end

treesitter.setup {
  auto_install = true,
  autotag = {
    enable = true
  },
  ensure_installed = {
    "bash",
    "css",
    "go",
    "gomod",
    "help",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "nix",
    "regex",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local okt, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if okt and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  sync_install = false,
}
