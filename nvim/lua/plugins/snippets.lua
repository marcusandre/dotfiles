return {
  {
    'L3MON4D3/LuaSnip',
    version = '2.*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      local ls = require('luasnip')
      local types = require('luasnip.util.types')

      ls.config.set_config({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
        ext_options = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '<-', 'Error' } },
            },
          },
        },
      })

      require('luasnip.loaders.from_vscode').lazy_load()

      vim.keymap.set({ 'i' }, '<C-K>', function() ls.expand() end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-L>', function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-J>', function() ls.jump(-1) end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-I>', function()
        if ls.choice_active() then ls.change_choice(1) end
      end, { silent = true })
    end,
  },
}
