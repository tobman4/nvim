## 2024-05-18 - Lazy load telescope config
**Learning:** Initializing plugins directly in `init.lua` can slow down Neovim startup time. Lazy loading with `lazy.nvim` and moving configuration inside `plugins.lua` improves startup speed.
**Action:** When adding new plugins or encountering slow plugins, look for opportunities to lazy load them using `lazy`, `cmd`, or `keys` inside `plugins.lua` and evaluate their `setup` inside `config = function() end`.
