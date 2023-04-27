return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.stylelint,
        -- null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.remark,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.zigfmt,
      },
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = true,
              })
            end,
          })
        end
      end,
    })
  end,
}
