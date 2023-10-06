-- https://github.com/Mte90/dotfiles/blob/master/.config/nvim/lua/plugin/coq.lua

vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    pre_select = false
  },
  clients = {
    lsp = {
      always_on_top = {"omnisharp"};
    },
    tmux = {
      enabled = false
    },
    buffers = {
      enabled = false
    },
    snippets = {
      enabled = false
    }
  }
}
