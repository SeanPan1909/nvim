return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- Configure basedpyright using new vim.lsp API
    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard", -- "off", "basic", "standard", "strict"
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
            diagnosticMode = "workspace",
            -- Disable specific diagnostics if they're too noisy
            diagnosticSeverityOverrides = {
              reportUnusedImport = "information",
              reportUnusedVariable = "information",
            },
          },
        },
      },
    })

    vim.lsp.enable("basedpyright")
  end,
}
