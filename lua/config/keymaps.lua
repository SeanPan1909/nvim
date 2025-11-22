-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Disable H and L for buffer navigation
unmap("n", "H")
unmap("n", "L")

-- Remap H and L for line navigation
map("n", "H", "^", { desc = "Go to first non-whitespace character" })
map("n", "L", "$", { desc = "Go to end of line" })
map("o", "H", "^", { desc = "Go to first non-whitespace character" })
map("o", "L", "$", { desc = "Go to end of line" })
map("v", "H", "^", { desc = "Go to first non-whitespace character" })
map("v", "L", "$", { desc = "Go to end of line" })

-- Code actions
map("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions" })

map("n", "J", "<C-d>zz", { desc = "scroll down half a page" })
map("n", "K", "<C-u>zz", { desc = "scroll up half a page" })

-- Enter creates new line and places cursor at proper indentation
map("n", "<CR>", "o", { desc = "New line below with auto-indent" })

-- Backspace joins lines without moving cursor
map("n", "<BS>", "mzJ`z", { desc = "Join line without moving cursor" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Tab navigation (using bufferline.nvim)
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

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

map("n", "<leader>i2", function()
  set_indent(2)
end, { desc = "Set indent to 2 spaces" })
map("n", "<leader>i4", function()
  set_indent(4)
end, { desc = "Set indent to 4 spaces" })

-- Make "c" command use black hole register (don't affect clipboard)
map("n", "c", '"_c', { desc = "Change without yanking" })
map("n", "C", '"_C', { desc = "Change to end of line without yanking" })
map("v", "c", '"_c', { desc = "Change without yanking" })

-- Disable Ctrl+f to allow Zellij to handle it (for fullscreen toggle)
map("n", "<C-f>", "<Nop>", { desc = "Disabled - pass through to Zellij" })
map("v", "<C-f>", "<Nop>", { desc = "Disabled - pass through to Zellij" })
map("i", "<C-f>", "<Nop>", { desc = "Disabled - pass through to Zellij" })

map({ "v", "n" }, "<leader>ce", function()
  return require("refactoring").refactor("Extract Function")
end, { desc = "Code Extract Function", expr = true })
map({ "v", "n" }, "<leader>cv", function()
  return require("refactoring").refactor("Extract Variable")
end, { desc = "Code Extract Variable", expr = true })
