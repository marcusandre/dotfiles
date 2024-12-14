return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>oG", "<Cmd>lua Snacks.gitbrowse.open()<CR>", desc = "Browse on GitHub" },
    { "<leader>og", "<Cmd>lua Snacks.lazygit.open()<CR>", desc = "Open Lazygit" },
    { "<leader>or", "<Cmd>lua Snacks.rename.rename_file()<CR>", desc = "Rename current file" },
    { "<leader>os", "<Cmd>lua Snacks.scratch()<CR>", desc = "Open scratch buffer" },
    { "<leader>oz", "<Cmd>lua Snacks.zen()<CR>", desc = "Enable zen mode" },
  },
  opts = {
    bigfile = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scratch = { enabled = true },
    zen = { enabled = true },
  },
}
