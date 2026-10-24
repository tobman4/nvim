local M = {}

M.get_capabilities = function()
  local ok_cmp, cmp_caps = pcall(function()
    return require("cmp_nvim_lsp").default_capabilities()
  end)
  return ok_cmp and cmp_caps or nil
end

return M
