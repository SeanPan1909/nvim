return { 
  "mikavilpas/yazi.nvim", 
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { 
      "nvim-lua/plenary.nvim",
      lazy = true 
    }
  },
  keys = {
    { "<leader>e", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi at the current file", },
    { "<leader>E", mode = { "n", "v" }, "<cmd>Yazi cwd<cr>", desc = "Open yazi at the current working directory" },
  }
}
