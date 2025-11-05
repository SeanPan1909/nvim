return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Disable K keymap so custom scroll mapping works
          { "K", false },
        },
      },
    },
  },
}
