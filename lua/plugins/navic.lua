return {
  -- Configure navic to display in winbar
  {
    "SmiteshP/nvim-navic",
    opts = {
      lsp = {
        auto_attach = true,
      },
      highlight = true,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    },
  },

  -- Setup winbar to display file path and navic
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- Autocmd to setup winbar when LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.documentSymbolProvider then
            -- Show file path relative to cwd and navic location
            vim.opt_local.winbar = "%f %#Comment#>%* %{%v:lua.require'nvim-navic'.get_location()%}"
          end
        end,
      })
    end,
  },
}
