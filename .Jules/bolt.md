
## $(date +%Y-%m-%d) - Lazy Load nvim-cmp
**Learning:** Eager loading of the `nvim-cmp` plugin directly from `init.lua` causes unnecessary execution of autocomplete-related logic during Neovim's initial load, increasing the overall startup time without providing immediate benefits.
**Action:** When configuring major plugins in a `lazy.nvim` setup, always define them directly in the plugin spec file (e.g., `lua/plugins.lua`) with an appropriate `event` (such as `InsertEnter`) and encapsulate setup logic inside a `config` property instead of relying on sequential eager `require()` calls at the root level.
