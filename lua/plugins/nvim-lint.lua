return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- Remove Go linters from nvim-lint because we use our own custom system
    if opts.linters_by_ft then
      opts.linters_by_ft.go = {}
      opts.linters_by_ft.gomod = {}
    end

    -- Add Python linting with ruff
    opts.linters_by_ft = opts.linters_by_ft or {}
    opts.linters_by_ft.python = { "ruff" }
  end,
}
