return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Disable K keymap so custom scroll mapping works
          { "K", false },
          { "gk", vim.lsp.buf.hover, desc = "LSP Hover" },
        },
      },
    },
  },
}
