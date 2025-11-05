-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Enable transparency for all colorschemes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      "NormalFloat",
      "NormalNC",
      "SignColumn",
      "LineNr",
      "Folded",
      "NonText",
      "SpecialKey",
      "VertSplit",
      "EndOfBuffer",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})

-- Treat Avro schema files as JSON for LSP support
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.avsc",
  callback = function()
    vim.bo.filetype = "json"
  end,
})
