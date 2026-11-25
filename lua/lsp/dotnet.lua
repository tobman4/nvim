local logging = require("logging")

local cmd = vim.fn.exepath("csharp-ls")
if cmd == "" then
  logging:warn("csharp-ls not found in PATH")
  return
end

local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local function extended_handler(...)
  return require("csharpls_extended").handler(...)
end

local handlers = {
  ["textDocument/definition"] = extended_handler,
  ["textDocument/typeDefinition"] = extended_handler,
}

vim.lsp.config.csharp_ls = {
  -- csharp-ls finds the .sln/.csproj relative to its process cwd, so start it
  -- in the project root discovered by root_dir below instead of Neovim's cwd.
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ cmd }, dispatchers, {
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  -- NOTE: "*.csproj" style glob markers do not work with vim.fs.root in this
  -- Neovim build, so match the extensions with a predicate function.
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(vim.fs.root(fname, function(name)
      return name:match("%.sln$") or name:match("%.slnx$") or name:match("%.csproj$")
    end))
  end,
  filetypes = { "cs", "csx" },
  get_language_id = function(_, ft)
    if ft == "cs" or ft == "csx" then
      return "csharp"
    end
    return ft
  end,
  init_options = {
    AutomaticWorkspaceInit = true
  },
  settings = {
    csharp = {
      useMetadataUris = true,
      -- Take indentation from the client (Neovim's shiftwidth/expandtab = 2
      -- spaces). Brace/newline style still comes from .editorconfig, since
      -- csharp-ls only reads TabSize/InsertSpaces from the LSP options.
      applyFormattingOptions = true,
    }
  },
  capabilities = ok_cmp and cmp_caps or nil,
  handlers = handlers,
}

vim.lsp.enable("csharp_ls")
