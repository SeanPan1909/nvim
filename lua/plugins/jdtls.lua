-- Neovim always uses Java 25 for jdtls (independent of shell JAVA_HOME)
-- This allows you to use Java 17 for other projects outside Neovim

-- Global variable to track formatting profile
-- "default" = 2-space indentation (normal preference)
-- "loveholidays" = 4-space Loveholidays formatter (exception)
vim.g.java_format_profile = vim.g.java_format_profile or "default"

return {
  -- Configure the underlying jdtls settings
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Always use Java 25 for jdtls in Neovim (overrides shell JAVA_HOME)
      vim.env.JAVA_HOME = "/Users/sean.pan/Library/Java/JavaVirtualMachines/openjdk-25/Contents/Home"

      -- Ensure opts.settings exists
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}

      -- Configure formatter settings based on active profile
      if vim.g.java_format_profile == "loveholidays" then
        -- Loveholidays formatter (4 spaces)
        local formatter_path = vim.fn.stdpath("config") .. "/loveholidays-eclipse-formatter.xml"
        local formatter_url = "file://" .. formatter_path

        opts.settings.java.format = {
          enabled = true,
          settings = {
            url = formatter_url,
            profile = "Loveholidays",
          },
        }
      else
        -- Default formatter with 2-space indentation
        opts.settings.java.format = {
          enabled = true,
          settings = {
            tabSize = 2,
            insertSpaces = true,
          },
        }
      end

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

  -- Set Java-specific indentation based on active profile
  {
    "LazyVim/LazyVim",
    opts = {
      -- Override Java file settings
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local indent_size = vim.g.java_format_profile == "loveholidays" and 4 or 2
          vim.opt_local.tabstop = indent_size
          vim.opt_local.shiftwidth = indent_size
          vim.opt_local.softtabstop = indent_size
          vim.opt_local.expandtab = true
        end,
      })

      -- Command to toggle between formatting profiles
      vim.api.nvim_create_user_command("JavaProfileToggle", function()
        if vim.g.java_format_profile == "default" then
          vim.g.java_format_profile = "loveholidays"
          print("Switched to Loveholidays profile (4 spaces)")
        else
          vim.g.java_format_profile = "default"
          print("Switched to default profile (2 spaces)")
        end
        -- Notify that LSP restart is needed for formatter changes
        print("Note: Restart LSP with :LspRestart for formatter changes to take effect")
        -- Update indentation for current buffer if it's a Java file
        if vim.bo.filetype == "java" then
          local indent_size = vim.g.java_format_profile == "loveholidays" and 4 or 2
          vim.opt_local.tabstop = indent_size
          vim.opt_local.shiftwidth = indent_size
          vim.opt_local.softtabstop = indent_size
        end
      end, { desc = "Toggle Java formatting profile" })
    end,
  },
}
