-- Add the directory containing the util.debug module to the Lua package path
package.path = package.path .. ";/path/to/your/module/?.lua"

-- Check if the vim.loader is available
if vim.loader then
  vim.loader.enable()
end

-- Create a global function to wrap the util.debug.dump function
_G.dd = function(...)
  require("util.debug").dump(...)
end

-- Override the vim.print function with the _G.dd function
vim.print = _G.dd

-- Load the configuration from the config.lazy module
require("config.lazy")

-- Commented out the autocmd section, as it's not directly related to the issue
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   pattern = { "*" },
--   command = "silent! wall",
--   nested = true,
-- })