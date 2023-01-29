local ok, lualine = pcall(require, "lualine")
if (not ok) then return end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin"
  }
})
