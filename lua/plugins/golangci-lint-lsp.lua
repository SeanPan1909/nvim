return {
  "neovim/nvim-lspconfig",
  opts = function()
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    -- Register golangci if not already registered
    if not configs.golangci then
      configs.golangci = {
        default_config = {
          cmd = { "golangci-lint-langserver" },
          root_dir = lspconfig.util.root_pattern("go.mod"),
          init_options = {
            command = { "/Users/sean.pan/go/bin/golangci-lint", "run", "--out-format", "json" },
          },
        },
      }
    end

    -- Setup the server
    lspconfig["golangci"].setup({
      flags = {
        debounce_text_changes = 150,
      },
      filetypes = { "go" },
    })
  end,
}
