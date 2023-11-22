vim.keymap.set(
  "n",
  "<leader>fS",
  "<Cmd>Pick lsp scope='workspace_symbol' symbol_query=vim.fn.input('Symbol: ')<CR>",
  { desc = "Symbols (Workspace)" }
)
