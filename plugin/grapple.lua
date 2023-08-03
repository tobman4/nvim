local grapple = require("grapple")

vim.keymap.set("n", "<leader>t", grapple.toggle)
vim.keymap.set("n", "tt", grapple.popup_tags)
