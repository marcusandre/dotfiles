return {
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      local types = require("luasnip.util.types")

      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_options = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "<-", "Error" } },
            },
          },
        },
      })

      require("luasnip.loaders.from_vscode").lazy_load()

      local luasnip_go_left = function()
        if luasnip.jumpable() then
          luasnip.jump(-1)
        end
      end

      local luasnip_go_right = function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end

      local luasnip_change_choice = function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end

      vim.keymap.set({ "i", "s" }, "<C-H>", function()
        luasnip_go_left()
      end)
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        luasnip_go_right()
      end)
      vim.keymap.set({ "i", "s" }, "<C-I>", function()
        luasnip_change_choice()
      end)
    end,
  },
}
