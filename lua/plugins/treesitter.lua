return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {
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
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<S-CR>",
        node_decremental = "<BS>",
      },
    },
  },
}
