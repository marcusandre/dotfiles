return {
  "dmmulroy/ts-error-translator.nvim",
  ft = { "typescript", "typescriptreact" },
  dependencies = { "dmmulroy/tsc.nvim" },
  config = function()
    require("ts-error-translator").setup()
    require("tsc").setup()
  end,
}
