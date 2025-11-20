return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
    },
    scratch = {
      enabled = false,
    },
  },
  keys = {
    { "<leader><space>", false },
    -- Smart picker
    { "<leader>sp", function() Snacks.picker.smart() end, desc = "Smart Picker" },
    -- File pickers (ff = root, fF = cwd)
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files (Root Dir)" },
    { "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find Files (cwd)" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    -- Search pickers (sg = root, sG = cwd)
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Root Dir)" },
    { "<leader>sG", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, desc = "Grep (cwd)" },
    { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "Grep through current buffers" },
    { "<leader>s.", function() Snacks.picker.grep({ buf = 0 }) end, desc = "Grep through current file" },
    -- Buffer picker
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    -- Diagnostic pickers
    { "<leader>xx", function() Snacks.picker.diagnostics() end, desc = "Diagnostics (Workspace)" },
    { "<leader>xX", function() Snacks.picker.diagnostics({ buf = 0 }) end, desc = "Diagnostics (Buffer)" },
    -- Git pickers
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Other pickers
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sM", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume Last Picker" },
  },
}
