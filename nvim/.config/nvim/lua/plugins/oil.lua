return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>e", "<Cmd>Oil<CR>", desc = "Open file explorer" },
  },
  opts = {
    columns = { "icon", "permissions", "size", "mtime" },
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
  },
}
