-- Ensure jdtls uses Java 21+ from jenv
-- Note: Make sure your jenv global version is Java 21 or higher (jenv global 25)
return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- If JAVA_HOME is not set or points to old Java, use Java 25 as fallback
      if not vim.env.JAVA_HOME or vim.env.JAVA_HOME == "" then
        vim.env.JAVA_HOME = "/Users/sean.pan/Library/Java/JavaVirtualMachines/openjdk-25/Contents/Home"
      end
      return opts
    end,
  },
}
