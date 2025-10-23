require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = "file_vsplit"
      }
    },
		layout_config = {
			prompt_position = "top"
		},
		pickers = {
			find_files = {
				theme = "dropdown"
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
