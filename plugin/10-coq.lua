-- https://github.com/Mte90/dotfiles/blob/master/.config/nvim/lua/plugin/coq.lua

vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    pre_select = false
  },
  clients = {
    tmux = {
      enabled = false
    },
    buffers = {
      enabled = false
    }
  }
}
