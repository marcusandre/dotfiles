return {
  {
    "folke/neodev.nvim",
    ft = "lua",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",

      -- snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- UI
      "onsails/lspkind-nvim",
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
      },
    },
    config = function()
      -- Mason
      require("mason").setup()

      -- Config
      local servers = require("m.configs.lsp").lua_servers
      local mason_lspconfig = require("mason-lspconfig")

      local on_attach = function(client, bufnr)
        if client.name == "tsserver" then client.server_capabilities.documentFormattingProvider = false end

        vim.api.nvim_buf_create_user_command(
          bufnr,
          "Format",
          function()
            vim.lsp.buf.format({
              async = true,
              bufnr = bufnr,
            })
          end,
          { desc = "Format current buffer with LSP" }
        )

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function() vim.lsp.buf.format({ async = false }) end,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
          command = "silent! EslintFixAll",
          group = vim.api.nvim_create_augroup("EslintFmt", {}),
        })
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })

      -- nvim-cmp
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      ---@diagnostic disable-next-line: missing-fields
      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp", keyword_length = 3 },
          { name = "path", keyword_length = 3 },
          { name = "buffer", keyword_length = 3 },
          { name = "luasnip" },
        }),
        ---@diagnostic disable-next-line: missing-fields
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
              gh_issues = "[issues]",
            },
          }),
        },
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
      })
    end,
  },
  -- {
  --   "luckasRanarison/clear-action.nvim",
  --   event = "LspAttach",
  --   opts = {
  --     signs = {
  --       show_count = false,
  --       enable = true,
  --       combine = true,
  --     },
  --     popup = {
  --       border = "single",
  --     },
  --     mappings = {
  --       code_action = "<leader>la",
  --     },
  --   },
  -- },
  -- {
  --   "dgagn/diagflow.nvim",
  --   opts = {
  --     enable = function()
  --       return vim.bo.filetype ~= "lazy"
  --     end,
  --     format = function(diagnostic)
  --       return '[LSP] ' .. diagnostic.message
  --     end,
  --     inline_padding_left = 3,
  --     placement = 'inline',
  --     scope = "line",
  --     toggle_event = { "InsertEnter" },
  --   },
  -- },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })
    end,
  },
}
