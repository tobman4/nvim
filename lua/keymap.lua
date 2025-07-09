-- Telescope
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })

-- GIT
vim.keymap.set("n", "<leader>gg", ":VGit project_diff_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", ":VGit project_logs_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gh", ":VGit buffer_history_preview<CR>", { noremap = true })
