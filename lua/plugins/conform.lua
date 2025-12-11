return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Java: Use LSP (jdtls) to preserve your custom profile setup
      java = { "lsp" },

      -- Python
      python = { "ruff_format", "ruff_organize_imports" },

      -- Go
      go = { "goimports", "gofmt" },

      -- JavaScript/TypeScript
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },

      -- Web
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },

      -- Markup
      markdown = { "prettier" },

      -- Config files
      toml = { "taplo" },

      -- SQL
      sql = { "sql_formatter" },

      -- Terraform
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },

      -- Lua
      lua = { "stylua" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },
    },

    -- Format on save disabled
    format_on_save = false,

    -- Formatter settings
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" }, -- 2 space indentation
      },
    },
  },
}
