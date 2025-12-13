local Snacks = require("snacks")

return {
  "snacks.nvim",
  opts = {
    terminal = {
      win = {
        position = "float",
        border = "rounded",
        width = 0.8,
        height = 0.8,
      },
    },
  },
  keys = {
    {
      "<leader>tt",
      function() Snacks.terminal.toggle() end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
  }
}
