return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python", "htmldjango" })
      end
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Pyright for Python/Flask type checking and LSP
        pyright = {
          before_init = function(_, config)
            local Path = require("plenary.path")
            local venv = Path:new(config.root_dir, "venv")
            if venv:joinpath("bin"):is_dir() then
              config.settings.python.pythonPath = tostring(venv:joinpath("bin", "python"))
            end
          end,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                autoImportCompletions = true,
              },
            },
          },
        },
        -- Alternative: basedpyright (faster, more modern fork of pyright)
        -- Uncomment below and comment out pyright if you prefer basedpyright
        -- basedpyright = {
        --   settings = {
        --     basedpyright = {
        --       analysis = {
        --         autoSearchPaths = true,
        --         diagnosticMode = "workspace",
        --         useLibraryCodeForTypes = true,
        --         typeCheckingMode = "basic",
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}
