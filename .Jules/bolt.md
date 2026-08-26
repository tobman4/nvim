## 2024-05-14 - Lazy Load Notification Plugin in Logging Module
**Learning:** Eagerly loading UI plugins (like `notify`) in core utility modules (like `logging`) blocks startup time because Neovim has to load the UI plugin just to load the core utility.
**Action:** When creating utility modules, always inline `require` statements for heavy UI dependencies directly within the methods that use them, avoiding eager evaluation at the file level. This leverages Lua's runtime caching while preventing the initial load penalty.
