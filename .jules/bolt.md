## 2024-05-17 - Disable diagnostic updates in insert mode
**Learning:** Setting `update_in_insert = true` in Neovim's `vim.diagnostic.config` forces synchronous or high-frequency diagnostic re-evaluations on every keystroke during Insert mode, leading to input lag and UI blocking, especially with heavy LSPs like rust-analyzer or pylsp.
**Action:** Always ensure `update_in_insert` is set to `false` (which is the default, but explicitly setting it helps prevent regressions) to optimize editor responsiveness and typing latency.
