return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Override default keymaps
    { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Search buffer file names" },
    { "<leader>s/", "<cmd>Telescope live_grep grep_open_files=true<cr>", desc = "Grep through current buffers" },
    { "<leader>s.", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Grep through current file" },
    -- Swapped file search keymaps
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", function()
      require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
    end, desc = "Find Files (Buffer Dir)" },
    -- Swapped grep keymaps
    { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
  },
}
