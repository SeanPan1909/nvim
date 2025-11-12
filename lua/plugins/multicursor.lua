return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    -- Add a cursor and jump to the next word under cursor (like Ctrl+d in VSCode)
    vim.keymap.set({ "n", "v" }, "<c-d>", function()
      mc.matchAddCursor(1)
    end)

    -- Clear all cursors with Ctrl+q
    vim.keymap.set({ "n", "v" }, "<c-q>", mc.clearCursors)
  end,
}
