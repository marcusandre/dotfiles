local M = {}

M.lua_servers = {
  cssls = {},
  eslint = {},
  gopls = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
  marksman = {},
  rust_analyzer = {},
  terraformls = {},
  yamlls = {},
}

return M
