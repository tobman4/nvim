-- Plugins
require("config")
require("nvim-cmp")
require("keymap")

-- LSP
require("lsp")
require("lsp.lua")
require("lsp.dotnet")
require("lsp.ts")

-- Settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end
})

vim.cmd("colorscheme deus")
