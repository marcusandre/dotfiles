local ok, auto_dark_mode = pcall(require, "auto-dark-mode")
if (not ok) then return end

-- Set background initially
if os.getenv('theme') == 'light' then
  vim.api.nvim_set_option('background', 'light')
else
  vim.api.nvim_set_option('background', 'dark')
end

vim.cmd.colorscheme "iceberg"

-- Set background dynamically
auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
  end,
})

auto_dark_mode.init()
