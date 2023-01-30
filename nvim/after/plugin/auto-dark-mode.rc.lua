local ok, auto_dark_mode = pcall(require, "auto-dark-mode")
if (not ok) then return end

-- Set background initially
if os.getenv('theme') == 'light' then
  vim.api.nvim_set_option('background', 'light')
else
  vim.api.nvim_set_option('background', 'dark')
end

-- Set background dynamically
local ok_catppuccin = pcall(require, "catppuccin")

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    if (ok_catppuccin) then vim.cmd.colorscheme "catppuccin-mocha" end
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
    if (ok_catppuccin) then vim.cmd.colorscheme "catppuccin-latte" end
  end,
})

auto_dark_mode.init()
