local notify = require("notify")

local Logger = {}
Logger.__index = Logger

function Logger:new(name)
  local instance = setmetatable(Logger, {});

  instance.minLevel = 1
  instance.name = name

  return instance
end

function Logger:info(msg)
  if(self.minLevel > 1) then
    return
  end

  notify.notify(msg, vim.log.levels.INFO, {
    title = self.name
  });
end

function Logger:warn(msg)
  if(self.minLevel > 2) then
    return
  end

  notify.notify(msg, vim.log.levels.WARN, {
    title = self.name
  })
end

function Logger:error(msg)
  if(self.minLevel > 3) then
    return
  end

  notify.notify(msg, vim.log.levels.ERROR, {
    title = self.name
  })
end

local m = Logger:new("root")
function m.get_logger(name)
  return Logger:new(name)
end

return m
