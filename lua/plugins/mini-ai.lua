return {
  "echasnovski/mini.ai",
  event = "VeryLazy",
  opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 500,
      custom_textobjects = {
        -- f = functions
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        -- c = classes
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        -- t = tags (HTML/XML)
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        -- d = digits
        d = { "%f[%d]%d+" },
        -- q = quotes (any type: ', ", `)
        q = ai.gen_spec.pair('"', '"', { type = "balanced" }),
        -- g = entire buffer
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line("$"),
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
    }
  end,
}
