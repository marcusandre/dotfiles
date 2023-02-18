local ok, mason = pcall(require, "mason")
if (not ok) then return end

mason.setup()

local ok, masonLSP = pcall(require, "mason-lspconfig")
if (not ok) then return end

masonLSP.setup {
  ensure_installed = { 
    "eslint",
    "gopls",
    "jsonls",
    "rust_analyzer",
    "stylelint_lsp",
    "lua_ls", 
    "tsserver",
  },
}

