return {
  'hrsh7th/nvim-cmp',
  lazy = false,
  priority = 100,
  dependencies = {
    -- sources
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- snippets
    { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- icons
    'onsails/lspkind.nvim',
  },
  config = function()
    local lspkind = require('lspkind')
    lspkind.init()

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
      },
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ['<C-p>'] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ['<C-y>'] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { 'i', 'c' }
        ),
      },
      snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
    })

    local ls = require('luasnip')
    ls.config.set_config({
      history = false,
      updateevents = 'TextChanged,TextChangedI',
    })

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/m/snippets/*.lua', true)) do
      loadfile(ft_path)()
    end

    vim.keymap.set({ 'i', 's' }, '<c-k>', function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<c-j>', function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })
  end,
}
