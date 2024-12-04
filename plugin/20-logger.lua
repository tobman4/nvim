local log = require("structlog")

log.configure({
  default = {
    pipelines = {
      -- {
      --   log.level.INFO,
      --   {
      --     log.processors.Timestamper("%H:%M:%S"),
      --   },
      --   log.formatters.Format( --
      --     "%s [%s] %s: %-30s",
      --     { "timestamp", "level", "logger_name", "msg" },
      --     { blacklist_all = true }
      --   ),
      --   log.sinks.Console(),
      -- },
      {
        log.level.INFO,
        {
          log.processors.Timestamper("%H:%M:%S")
        },
        log.formatters.Format(
          "%s [%s]: %-10s",
          { "timestamp", "level", "msg" },
          { blacklist_all = true }
        ),
        log.sinks.RotatingFile(
          "/home/tl/logs/nvim.log",
          {
            max_size = 500000000, -- 500MB
            max_age = 259200 -- 3 days
          }
        )
      }
    }
  }
})

local logger = log.get_logger("default")
logger:info("Logger <START>")
