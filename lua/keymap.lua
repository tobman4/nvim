-- File Explorer
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })

-- GIT
vim.keymap.set("n", "<leader>gg", ":VGit project_diff_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", ":VGit project_logs_preview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gh", ":VGit buffer_history_preview<CR>", { noremap = true })

-- LSP
vim.keymap.set("i", "<C-s>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true });

vim.keymap.set("n", "<leader>gd", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { silent = true, noremap = true, desc = "Go to definition in vertical split" })

-- Window Resizing
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Magic buffer-picking mode
map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)
