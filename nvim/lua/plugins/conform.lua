return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    { '<leader>lf', '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>', desc = 'Format' },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofumpt' },
      terraform = { 'terraform_fmt' },
      markdown = { 'prettier' },
    },
    log_level = vim.log.levels.DEBUG,
  },
  init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
}
