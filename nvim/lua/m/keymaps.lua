vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- vim.keymap.set('n', '<leader><space>', '<cmd>bp<cr>', { desc = 'Buffer previous' })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "n", "nzz")

vim.keymap.set("n", "<leader>z", "<Cmd>wq<cr>", { desc = "Save and Quit" })

local function qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

vim.keymap.set("n", "<leader>c", qf, { desc = "Save and Quit" })
