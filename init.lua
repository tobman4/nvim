-- Plugins
require("config")
require("nvim-cmp")
require("keymap")

-- LSP
require("lsp")

-- DAP
require("my-dap")

-- Settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.cmd("colorscheme deus")
