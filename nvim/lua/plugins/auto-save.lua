return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Optional lazy load on command
    event = { "InsertLeave", "TextChanged" }, -- Optional lazy load on these events
    opts = {
      enabled = true, -- Enable auto-save when the plugin is loaded
      execution_message = {
        
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_defered_save = { "InsertEnter" },
      },
      condition = nil, -- Use no specific condition for saving
      write_all_buffers = false, -- Only save the current buffer
      noautocmd = false, -- Do not suppress autocommands
      lockmarks = false,
      debounce_delay = 1000, -- Save after 1000ms
      debug = false, -- Disable debug logging
    },
  },
}