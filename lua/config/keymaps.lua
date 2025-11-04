-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<leader>k", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>l", "<C-w>l", { desc = "switch window right" })

-- Tab navigation (using bufferline.nvim)
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- Code actions
map("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Java profile toggle
map("n", "<leader>cj", "<cmd>JavaProfileToggle<cr>", { desc = "Toggle Java format profile" })

-- Indentation switching
local function set_indent(size)
  vim.bo.shiftwidth = size
  vim.bo.tabstop = size
  vim.bo.softtabstop = size
  vim.bo.expandtab = true
  print("Indentation set to " .. size .. " spaces")
end

map("n", "<leader>i2", function() set_indent(2) end, { desc = "Set indent to 2 spaces" })
map("n", "<leader>i4", function() set_indent(4) end, { desc = "Set indent to 4 spaces" })
