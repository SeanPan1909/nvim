return {
  "neovim/nvim-lspconfig",
  lazy = false,
  import = "plugins.lspconfig",
  keys = {
    { "gk", vim.lsp.buf.hover, desc = "Display language information" },
    -- gd, gr, gi, gt are handled by snacks picker (see snacks/picker.lua)
    { "gn", vim.lsp.buf.rename, desc = "Rename symbol" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
    { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics" },
    { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
    {
      "[e",
      function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = "Go to previous error",
    },
    {
      "]e",
      function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = "Go to next error",
    },
  },
  config = function()
    -- Configure diagnostics display
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "if_many",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Define diagnostic signs
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- Setup servers with default configuration using new vim.lsp API
    local default_servers = {
      "gopls",
      "html",
      "cssls",
      "ts_ls",
      "jsonls",
      "yamlls",
      "bashls",
      "marksman",
      "dockerls",
      "rust_analyzer",
      "clangd",
    }

    for _, server in ipairs(default_servers) do
      vim.lsp.enable(server)
    end
  end,
}
