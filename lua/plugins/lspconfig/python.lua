return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- Use basedpyright on Unix systems, pyright on Windows
    local is_windows = vim.fn.has("win32") == 1
    local lsp_name = is_windows and "pyright" or "basedpyright"

    -- Configure the Python LSP
    vim.lsp.config(lsp_name, {
      settings = {
        -- basedpyright uses "basedpyright" key, pyright uses "python"
        [is_windows and "python" or "basedpyright"] = {
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

    vim.lsp.enable(lsp_name)
  end,
}
