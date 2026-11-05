return {
  -- <leader>go: open the commit that last touched this line, as a diff in a new tab
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>go",
        function()
          local async = require("gitsigns.async")
          local cache = require("gitsigns.cache").cache
          async.run(function()
            local bufnr = vim.api.nvim_get_current_buf()
            local lnum = vim.api.nvim_win_get_cursor(0)[1]
            local bcache = cache[bufnr]
            if not bcache then
              return
            end
            bcache:get_blame(lnum)
            local info = bcache.blame and bcache.blame.entries and bcache.blame.entries[lnum]
            if not info then
              return
            end
            if tonumber("0x" .. info.commit.sha:sub(1, 8)) == 0 then
              vim.notify("Line not committed yet", vim.log.levels.WARN)
              return
            end
            vim.cmd.tabnew()
            require("gitsigns.actions.diffthis").show(bufnr, info.commit.sha, info.filename)
            async.schedule()
            pcall(vim.api.nvim_win_set_cursor, 0, { info.orig_lnum or lnum, 0 })
          end)
        end,
        desc = "Open file from blamed commit",
      },
    },
  },

  -- VSCode-style side-by-side diff with file explorer (:CodeDiff)
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    opts = {
      explorer = { view_mode = "tree", line_stats = { enabled = true } },
      diff = { compact = true, compact_context_lines = 8 },
    },
  },
}
