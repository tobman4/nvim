## 2026-06-10 - [Neovim Diagnostics UI Lag]
**Learning:** [Setting `update_in_insert = true` for Neovim diagnostics causes significant typing lag due to continuous evaluation in insert mode.]
**Action:** [Always ensure `update_in_insert` is set to `false` in `vim.diagnostic.config` to prevent this performance degradation.]