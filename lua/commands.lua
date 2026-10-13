local logger = require("logging").get_logger("validator")
logger.minLevel = 1


---@param repo string
---@return string?
local function GetRepoData(repo)
  local data = vim.system({ "curl", "-s", "https://api.github.com/repos/" .. repo }, { text = true }):wait()
  if(data.code == 0) then
    return data.stdout
  else
    logger:error("Unable to get repo " .. repo)
  end
end

local function TestPlugin(name, repo)
  local jsonStr = GetRepoData(repo)
  if(jsonStr == nil) then
    print("Unable to get data for " .. name)
    return
  end

  local repoData = vim.json.decode(jsonStr)
  if(repoData.archived) then
    logger:warn("Plugin " .. name .. " is archived")
  else
    logger:info("Plugin " .. name .. " is ok")
  end
end

vim.api.nvim_create_user_command("LazyPlugins", function()
    local plugins = require("lazy").plugins()

    for _, plugin in ipairs(plugins) do
      TestPlugin(plugin.name, plugin[1])
    end
end, { desc = "Print a list of all plugins managed by lazy.nvim" })
