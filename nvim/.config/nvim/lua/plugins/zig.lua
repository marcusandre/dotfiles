return {
  "ziglang/zig.vim",
  ft = { "zig", "zon" },
  config = function()
    vim.g.zig_fmt_parse_errors = 0
    vim.g.zig_fmt_autosave = 0
  end,
}
