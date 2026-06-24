## 2024-06-25 - Defer LSP exepath Lookup
**Learning:** Synchronous executable lookups (`vim.fn.exepath`) at module load time block Neovim's startup. Neovim's LSP API allows `cmd` to be a function, enabling lazy execution of the path lookup until the LSP client actually starts.
**Action:** Always wrap `vim.fn.exepath` in a function assigned to the `cmd` field in `vim.lsp.config.*` to ensure it runs lazily, saving ~50ms of synchronous startup time.
