return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Optional lazy load on command
    event = { "InsertLeave", "TextChanged" }, -- Optional lazy load on these events
    opts = {
      enabled = false, -- Auto-save is disabled by default
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_deferred_save = { "InsertEnter" }, -- Corrected this option
      },
      condition = nil, -- Use no specific condition for saving
      write_all_buffers = false, -- Only save the current buffer
      noautocmd = false, -- Do not suppress autocommands
      lockmarks = false,
      debounce_delay = 1000, -- Save after 1000ms
      debug = false, -- Disable debug logging

      -- Custom notification for save
      callbacks = {
        after_saving = function()
          -- Use LazyVim's notify system
          if vim.notify then
            vim.notify("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO, { title = "AutoSave" })
          else
            vim.api.nvim_echo({{"AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), "None"}}, false, {})
          end
        end,
      },
    },
  },
}



-- return {
--   {
--     "okuuva/auto-save.nvim",
--     cmd = "ASToggle", -- Optional lazy load on command
--     event = { "InsertLeave", "TextChanged" }, -- Optional lazy load on these events
--     opts = {
--       enabled = true, -- Enable auto-save when the plugin is loaded
--       execution_message = {
--         message = function()
--           return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
--         end,
--         dim = 0.18,
--         cleaning_interval = 1250,
--       },
--       trigger_events = {
--         immediate_save = { "BufLeave", "FocusLost" },
--         defer_save = { "InsertLeave", "TextChanged" },
--         cancel_deferred_save = { "InsertEnter" }, -- Corrected this option
--       },
--       condition = nil, -- Use no specific condition for saving
--       write_all_buffers = false, -- Only save the current buffer
--       noautocmd = false, -- Do not suppress autocommands
--       lockmarks = false,
--       debounce_delay = 1000, -- Save after 1000ms
--       debug = false, -- Disable debug logging

--     },
--   },
-- }