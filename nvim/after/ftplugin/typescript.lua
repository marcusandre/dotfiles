-- https://github.com/echasnovski/mini.nvim/issues/306
vim.b.minicompletion_config = {
  lsp_completion = {
    process_items = function(items, base)
      -- Remove dots as prefix from `textEdit.newText` as it is used verbatim
      for _, item in ipairs(items) do
        local new_text = (item.textEdit or {}).newText
        if type(new_text) == 'string' then item.textEdit.newText = new_text:gsub('^%.+', '') end
      end

      return MiniCompletion.default_process_items(items, base)
    end,
  },
}
