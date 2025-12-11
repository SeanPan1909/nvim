return {
  "Saghen/blink.cmp",
  version = "*", -- always use latest stable
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "default",
    },
    snippets = {
      preset = "default"
    },
  },
}
