return {
  "seblyng/roslyn.nvim",
  config = function()
    require("roslyn").setup({
      root_dir = function(fname)
        return vim.fs.root(fname, { ".sln", "Assets", "Packages", "ProjectSettings" })
      end,
    })
  end,
}
