return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Optional lazy load on command
    event = { "InsertLeave", "TextChanged" }, -- Optional lazy load on these events
    keys = {
      {
        "<leader>ja",
        function()
          -- Track state ourselves since plugin state checking is unreliable
          if not _G.autosave_state then
            _G.autosave_state = false -- Start disabled (matches opts.enabled = false)
          end

          -- Toggle the plugin
          vim.cmd("ASToggle")

          -- Update our state tracking
          _G.autosave_state = not _G.autosave_state

          -- Show correct message
          local status = _G.autosave_state and "enabled" or "disabled"
          local icon = _G.autosave_state and "󰆓 " or "󰅖 "
          LazyVim.notify(icon .. "Auto-save " .. status, { title = "Auto-Save" })
        end,
        desc = "Toggle Auto-Save",
      },
    },
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
            vim.notify(
              "󰆓 AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
              vim.log.levels.INFO,
              { title = "AutoSave" }
            )
          else
            vim.api.nvim_echo({ { "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), "None" } }, false, {})
          end
        end,
      },
    },
  },
}
