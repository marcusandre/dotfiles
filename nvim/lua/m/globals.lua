P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  local ok, plenary_reload = pcall(require, "plenary.reload")
  if ok then return plenary_reload.reload_module(...) end
  return nil
end

R = function(name)
  RELOAD(name)
  return require(name)
end
