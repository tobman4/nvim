-- File Explorer
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Telescope


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

-- Lspsaga
vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { noremap = true, silent = true, desc = "Lspsaga Finder" })
vim.keymap.set({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true, desc = "Lspsaga Code Action" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "Lspsaga Hover Doc" })
vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Lspsaga Rename" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga Peek Definition" })
vim.keymap.set("n", "<leader>li", "<cmd>Lspsaga incoming_calls<CR>", { noremap = true, silent = true, desc = "Lspsaga Incoming Calls" })
vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<CR>", { noremap = true, silent = true, desc = "Lspsaga Outgoing Calls" })
vim.keymap.set("n", "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true, desc = "Lspsaga Diagnostic Jump Next" })
vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true, desc = "Lspsaga Diagnostic Jump Prev" })
vim.keymap.set("n", "<leader>ll", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true, desc = "Lspsaga Outline" })
vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true, desc = "Lspsaga Toggle Terminal" })

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
