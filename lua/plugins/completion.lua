-- Import the LazyVim blink.cmp extra
return {
  -- Import the blink extra from LazyVim
  { import = "lazyvim.plugins.extras.coding.blink" },

  -- Override the keymap preset to use super-tab
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab", -- This makes Tab accept/confirm completion
      },
    },
  },
}
