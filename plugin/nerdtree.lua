vim.api.nvim_set_keymap('n','<C-q>',':lua NerdOpen()<CR>',{ noremap = true, silent = true });
vim.api.nvim_set_keymap('n','<C-f>',':NERDTreeFocus<CR>', { noremap = true, silent = true });


function NerdOpen()

  local nerdtree_buffer_name = "NERD_tree_1"

  for _,win in ipairs(vim.api.nvim_list_wins()) do
    local curr = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)

    if buf_name:find(nerdtree_buffer_name) then
      if win == curr then vim.cmd(":NERDTreeClose")
      else vim.cmd(":NERDTreeFocus") end
      return
    end
  end

  vim.cmd(":NERDTree");

end

