local M = {}

-- Function to dump any Lua object with formatting
M.dump = function(...)
  local args = { ... }
  local output = {}
  for _, v in ipairs(args) do
    table.insert(output, vim.inspect(v)) -- Pretty print using vim.inspect
  end
  print(table.concat(output, "\n")) -- Print each item on a new line
end

-- Function to log a debug message to a file
M.log = function(msg)
  local log_file = vim.fn.stdpath("data") .. "/debug.log"
  local f = io.open(log_file, "a") -- Open file in append mode
  if f then
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    f:write(string.format("[%s] %s\n", timestamp, msg))
    f:close()
  else
    print("Error: Unable to write to log file.")
  end
end

-- Shortcut to print debug messages (for quick checks)
M.print = function(msg)
  print("[DEBUG] " .. vim.inspect(msg))
end

return M