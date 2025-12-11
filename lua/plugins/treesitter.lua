return { 
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      highlight = { enabled = true },
      indent = { enabled = true },
      incremental_selection = { enabled = true }
    })
  end
}
