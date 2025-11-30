return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  config = function()
    local refactoring = require("refactoring")

    -- Setup with Go prompts enabled (prompts only when types can't be inferred)
    refactoring.setup({
      prompt_func_param_type = {
        go = true,
      },
      prompt_func_return_type = {
        go = true,
      },
      -- Show messages when extracting
      show_success_message = true,
    })
    return nil
  end,
}
