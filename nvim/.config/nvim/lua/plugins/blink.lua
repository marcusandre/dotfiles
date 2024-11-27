return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "niuiic/blink-cmp-rg.nvim",
  },
  version = "v0.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "ripgrep", "lazydev" },
      },
      providers = {
        ripgrep = {
          module = "blink-cmp-rg",
          name = "Ripgrep",
        },
        lsp = { fallback_for = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
  },
}
