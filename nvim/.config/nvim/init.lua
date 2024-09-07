---@param module string
local function safeRequire(module)
  local success, loadedModule = pcall(require, module)
  if success then return loadedModule end
  vim.cmd.echo("Error loading " .. module)
end

safeRequire("config.lazy")
safeRequire("config.options")
safeRequire("config.keymaps")
safeRequire("config.autocmds")
