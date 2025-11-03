-- Ensure jdtls uses Java 21+ from jenv
-- Note: Make sure your jenv global version is Java 21 or higher (jenv global 25)
return {
  -- Configure the underlying jdtls settings
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- If JAVA_HOME is not set or points to old Java, use Java 25 as fallback
      if not vim.env.JAVA_HOME or vim.env.JAVA_HOME == "" then
        vim.env.JAVA_HOME = "/Users/sean.pan/Library/Java/JavaVirtualMachines/openjdk-25/Contents/Home"
      end

      -- Configure Eclipse formatter
      local formatter_path = vim.fn.stdpath("config") .. "/loveholidays-eclipse-formatter.xml"
      -- Convert to file:// URL as required by jdtls
      local formatter_url = "file://" .. formatter_path

      -- Ensure opts.settings exists
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}

      -- Configure formatter settings
      opts.settings.java.format = {
        enabled = true,
        settings = {
          url = formatter_url,
          profile = "Loveholidays",
        },
      }

      -- Import organization settings
      opts.settings.java.imports = {
        gradle = {
          enabled = false,
        },
      }

      -- Custom import order matching IntelliJ LoveHolidays style
      opts.settings.java.completion = {
        importOrder = {
          "#", -- Static imports first
          "",  -- Blank line
          "com.travelmatch",
          "com.loveholidays",
          "",  -- Blank line
          "javax",
          "java",
          "",  -- Blank line
        },
      }

      -- Code generation preferences
      opts.settings.java.codeGeneration = {
        generateComments = true,
        useBlocks = true,
      }

      -- Save actions
      opts.settings.java.saveActions = {
        organizeImports = true,
      }

      return opts
    end,
    ft = "java",
  },

  -- Set Java-specific indentation
  {
    "LazyVim/LazyVim",
    opts = {
      -- Override Java file settings
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.expandtab = true
        end,
      })
    end,
  },
}
