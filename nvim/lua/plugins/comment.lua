return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' }, 'gcc' },
    },
    opts = {
      pre_hook = function(ctx)
        return require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()(ctx)
      end,
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
}
