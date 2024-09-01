return {
  "nvimdev/indentmini.nvim",
  config = function()
    require("indentmini").setup()

    -- Kanagawa highlights
    vim.cmd.highlight("IndentLine guifg=#54546d")
    vim.cmd.highlight("IndentLineCurrent guifg=#938aa9")
  end,
}
