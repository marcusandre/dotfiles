return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "zbirenbaum/copilot-cmp",
    "petertriho/cmp-git",
  },
  config = function()
    local cmp = require("cmp")

    require("copilot_cmp").setup()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        -- selection
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        -- scrolling
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- completion
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = "lazydev", group_index = 0 },
        { name = "copilot", group_index = 0 },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "git" },
      }),
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
    })
  end,
  init = function() table.insert(require("cmp").get_config().sources, { name = "git" }) end,
}
