-- Telescope
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })

-- GIT
vim.keymap.set("n", "<leader>gg", ":VGit project_diff_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", ":VGit project_logs_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gh", ":VGit buffer_history_preview<CR>", { noremap = true })

-- LSP
vim.keymap.set("i", "<C-s>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true });

-- Window Resizing
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
