return {
  "nvimdev/indentmini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("indentmini").setup()

    -- Duskfox highlights
    -- vim.cmd.highlight("IndentLine guifg=#4b4673")
    -- vim.cmd.highlight("IndentLineCurrent guifg=#6e6a86")

    -- Nightfly highlights
    vim.cmd.highlight("IndentLine guifg=#0e293f")
    vim.cmd.highlight("IndentLineCurrent guifg=#4b6479")

    -- Kanagawa highlights
    -- vim.cmd.highlight("IndentLine guifg=#54546d")
    -- vim.cmd.highlight("IndentLineCurrent guifg=#938aa9")
  end,
}
