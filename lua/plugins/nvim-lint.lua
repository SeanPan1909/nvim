return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- Remove Go linters from nvim-lint
    if opts.linters_by_ft then
      opts.linters_by_ft.go = {}
      opts.linters_by_ft.gomod = {}
    end
  end,
}
