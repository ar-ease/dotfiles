return {
  {
    "Pocco81/auto-save.nvim", -- Auto-save plugin
    version = false, -- Use the latest version
    event = "BufRead", -- Load the plugin when any buffer is read
    config = function()
      require("auto-save").setup({
        enabled = true, -- Start auto-save when the plugin is loaded
        execution_message = {
          message = function() -- Message to print on save
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18, -- Dim the color of `message`
          cleaning_interval = 1250, -- Automatically clean MsgArea after displaying `message`
        },


      --trigger_events = {"InsertLeave", "TextChanged"}, --  vim events that trigger auto-save. See :h events
      trigger_events = {"BufLeave"},  -- only trigger when leaving buffer
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")
          if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true -- Buffer can be saved
          end
          return false -- Buffer can't be saved
        end,
        write_all_buffers = false, -- Write only the current buffer
        debounce_delay = 135, -- Save every 135 milliseconds after a change
        callbacks = { -- Functions to be executed at different intervals
          enabling = nil,
          disabling = nil,
          before_asserting_save = nil,
          before_saving = nil,
          after_saving = nil,
        }
      })
    end,
  },
}