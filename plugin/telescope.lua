require('telescope').setup{ 
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  defaults = { 
    mappings = {
      i = {
        ["<C-s>"] = "file_vsplit"
      }
    },
    file_ignore_patterns = { 
      "__pycache__",
      "%.env",
      "obj",
      "bin",
      "node_modules"
    }
  }
}

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', 'G', builtin.live_grep, {})
vim.keymap.set('n', 'F', ':Telescope find_files<CR>')
vim.keymap.set('n', '<F1>', builtin.help_tags, {})

vim.keymap.set('n','<C-t>b',':Telescope buffers<CR>');
vim.keymap.set('n','<C-t>d',':Telescope diagnostics<CR>');
vim.keymap.set('n','<C-t>k',':Telescope keymaps<CR>');
