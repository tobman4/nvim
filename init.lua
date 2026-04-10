-- Plugins
require("config")
require("nvim-cmp")
require("keymap")

-- LSP
require("lsp")
require("lsp.lua")
require("lsp.dotnet")

-- Settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.cmd("colorscheme sorbet")
