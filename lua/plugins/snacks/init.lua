
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    import = "plugins.snacks",
    opts = {
      animate = {enabled = true },
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      debug = { enabled = false },
      dim = { enabled = true },
      explorer = { enabled = false },
      gh = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      keymap = { enabled = true },
      layout = { enabled = false }, -- No clue what this does
      lazygit = { enabled = false }, --TODO: Maybe worth my time to checkout what Lazygit does (it's a standalone program that can be integrated into neovim)
      notify = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      picker = {
        enabled = true,
        opts = {
          find = {
            args = { "--hidden", "--glob", "!.git", "--glob", "!venv", "--glob", "!**/venv/**" }
          }
        }
      },
      quickfile = { enabled = false },
      rename = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = { enabled = true },
      util = { enabled = false },
      win = { enabled = true },
      words = { enabled = true },
      zen = { enabled = false },
    },
  }
