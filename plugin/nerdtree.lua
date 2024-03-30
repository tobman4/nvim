local logger = require("structlog").get_logger("default")


vim.api.nvim_set_keymap('n','<C-q>',':lua NerdOpen()<CR>',{ noremap = true, silent = true });
vim.api.nvim_set_keymap('n','<C-f>',':NERDTreeFocus<CR>', { noremap = true, silent = true });


local function get_nerdtree_window()
  local windows = vim.api.nvim_list_wins();

  for _,win in pairs(windows) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)

    if name:find("NERD_tree") then
      return win
    end
  end

  return nil
end

function NerdOpen()
  local current_window = vim.api.nvim_get_current_win()
  local nerdtree_window = get_nerdtree_window()

  logger:info(string.format("current: %s nerdtree: %s", current_window, nerdtree_window))

  if nerdtree_window == nil then
    logger:info("No nerdtree open")
    vim.cmd(":NERDTree")
  else
    if nerdtree_window == current_window then
      vim.cmd(":NERDTreeClose")
      logger:info("Closing nerd tree")
    else
      vim.cmd("NERDTreeFocus")
      logger:info("Focusing nerd tree")
    end
  end
end

