return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      -- Core languages matching your LSP setup
      "lua",
      "python",
      "java",
      "go",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "yaml",
      "bash",
      "markdown",
      "markdown_inline",
      "dockerfile",
      "rust",
      "c",
      "cpp",
      -- Additional useful parsers
      "vim",
      "vimdoc",
      "regex",
      "comment",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
