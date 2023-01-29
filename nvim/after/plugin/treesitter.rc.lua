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
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  sync_install = false,
}

