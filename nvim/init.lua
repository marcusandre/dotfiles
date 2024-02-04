vim.loader.enable()

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core
require('m.lazy')
require('m.settings')
require('m.keymaps')
