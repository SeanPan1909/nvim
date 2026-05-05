return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Navbuddy",
  keys = {
    { "<leader>nb", "<cmd>Navbuddy<cr>", desc = "Open navbuddy" },
  },
  opts = {
    lsp = {
      auto_attach = true,
    },
  },
}
