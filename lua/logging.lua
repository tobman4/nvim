local Logger = {}
Logger.__index = Logger

function Logger:new(name)
  local instance = setmetatable({}, Logger)

  instance.minLevel = 1
  instance.name = name or "root"

  return instance
end

local function notify_fidget(logger_name, level, level_str, msg)
  local fidget_ok, fidget = pcall(require, "fidget")
  local formatted_msg = string.format("[%s] [%s] %s", logger_name, level_str, msg)

  if fidget_ok then
    fidget.notify(formatted_msg, level, {
      annote = string.format("%s • %s", logger_name, level_str),
    })
  else
    vim.notify(formatted_msg, level)
  end
end

function Logger:info(msg)
  if self.minLevel > 1 then
    return
  end

  notify_fidget(self.name, vim.log.levels.INFO, "INFO", msg)
end

function Logger:warn(msg)
  if self.minLevel > 2 then
    return
  end

  notify_fidget(self.name, vim.log.levels.WARN, "WARN", msg)
end

function Logger:error(msg)
  if self.minLevel > 3 then
    return
  end

  notify_fidget(self.name, vim.log.levels.ERROR, "ERROR", msg)
end

local m = Logger:new("root")
function m.get_logger(name)
  return Logger:new(name)
end

return m
