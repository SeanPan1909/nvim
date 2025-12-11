return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- Configure lua_ls using new vim.lsp API
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            -- Recognize vim global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              "${3rd}/busted/library",
            },
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace",
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    vim.lsp.enable("lua_ls")
  end,
}
