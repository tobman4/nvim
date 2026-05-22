-- Plugins
require("config")
require("nvim-cmp")
require("keymap")

-- LSP
require("lsp")

-- Settings
vim.g.python_recommended_style = 0 -- Stop python from forcing 4 spaces

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.cmd("colorscheme rose-pine-moon")
