-- ~/.config/nvim/lua/lsp-setup.lua
return {
  "neovim/nvim-lspconfig",
  keys = {
    {'gk', vim.lsp.buf.hover, desc = "Display language information"}
  }
}

