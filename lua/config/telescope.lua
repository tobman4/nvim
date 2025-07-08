require("telescope").setup({
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
})
