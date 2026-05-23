-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

-- Dockerfile LSP
local dockerls = os.getenv("DOCKERLS_PATH") or vim.fn.exepath("docker-langserver")
if dockerls ~= "" then
  vim.lsp.config.dockerls = {
    cmd = { dockerls, "--stdio" },
    filetypes = { "dockerfile" },
    single_file_support = true,
    capabilities = ok_cmp and cmp_caps or nil,
  }
  vim.lsp.enable("dockerls")
else
  vim.notify("docker-langserver not found (set $DOCKERLS_PATH or add to PATH)", vim.log.levels.WARN)
end

-- Docker Compose LSP
local docker_compose_ls = os.getenv("DOCKER_COMPOSE_LS_PATH") or vim.fn.exepath("docker-compose-langserver")
if docker_compose_ls ~= "" then
  vim.lsp.config.docker_compose_language_service = {
    cmd = { docker_compose_ls, "--stdio" },
    filetypes = { "yaml.docker-compose", "dockercompose" },
    single_file_support = true,
    root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    capabilities = ok_cmp and cmp_caps or nil,
  }
  vim.lsp.enable("docker_compose_language_service")
else
  vim.notify("docker-compose-langserver not found (set $DOCKER_COMPOSE_LS_PATH or add to PATH)", vim.log.levels.WARN)
end
