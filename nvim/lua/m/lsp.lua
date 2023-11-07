local M = {}

M.lua_servers = {
  cssls = {},
  eslint = {},
  gopls = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      runtime = {
        version = "LuaJIT",
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
