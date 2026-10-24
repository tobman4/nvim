## 2026-06-17 - [Nvim Startup Optimization]
**Learning:** [Eager loading large plugin configuration modules like nvim-cmp during Neovim init directly impacts startup time. lazy.nvim allows deferring this.]
**Action:** [Always use lazy loading mechanisms (e.g., `event = "InsertEnter"` and `config = function() require(...) end`) for non-critical startup plugins to enhance performance.]
