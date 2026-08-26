local notify = require("notify")

local Logger = {}
Logger.__index = Logger

function Logger:new(name)
  local instance = setmetatable({}, self);

  instance.name = name

  return instance
end

function Logger:info(msg)
  notify.notify(msg, vim.log.levels.INFO, {
    title = self.name
  });
end

function Logger:warn(msg)
  notify.notify(msg, vim.log.levels.WARN, {
    title = self.name
  })
end

function Logger:error(msg)
  notify.notify(msg, vim.log.levels.ERROR, {
    title = self.name
  })
end

local m = Logger:new("root")
function m.get_logger(name)
  return Logger:new(name)
end

return m
