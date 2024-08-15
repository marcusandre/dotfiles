return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
  keys = {
    { "<leader>fb", "<Cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader>fc", "<Cmd>FzfLua quickfix<CR>", desc = "Quickfix" },
    { "<leader>ff", "<Cmd>FzfLua files<CR>", desc = "Files" },
    { "<leader>fg", "<Cmd>FzfLua live_grep_resume<CR>", desc = "Grep live" },
    { "<leader>fh", "<Cmd>FzfLua helptags<CR>", desc = "Helptags" },
    { "<leader>fl", "<Cmd>FzfLua blines<CR>", desc = "Buffer lines" },
    { "<leader>fL", "<Cmd>FzfLua lines<CR>", desc = "Lines" },
    { "<leader>fo", "<Cmd>FzfLua oldfiles<CR>", desc = "Old files" },
    { "<leader>fR", "<Cmd>FzfLua resume<CR>", desc = "Resume" },
    { "<leader>fs", "<Cmd>FzfLua git_status<CR>", desc = "Git status" },
    { "<leader>fw", "<Cmd>FzfLua grep_cword<CR>", desc = "Grep word" },
    { "<leader>fx", "<Cmd>FzfLua builtin<CR>", desc = "Builtin" },
    { "<leader>fz", "<Cmd>FzfLua spell_suggest<CR>", desc = "Spelling" },
  },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({ fzf_colors = true })
    fzf.register_ui_select()
  end,
}
