return {
  {
    'numToStr/Comment.nvim',
    enabled = false,
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = true,
        opts = { enable_autocmd = false },
      },
    },
    opts = {
      pre_hook = function(ctx)
        return require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()(ctx)
      end,
    },
  },
}
