return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  config = function()
    require("roslyn").setup({
      root_dir = function(fname)
        return vim.fs.root(fname, { ".sln", "Assets", "Packages", "ProjectSettings" })
      end,
    })
  end,
}
