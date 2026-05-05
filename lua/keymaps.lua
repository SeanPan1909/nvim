local map = vim.keymap.set

local function get_visual_selection()
  local mode = vim.fn.mode():sub(1, 1)
  if mode == "v" or mode == "V" or mode == "\22" then
    vim.cmd("normal! " .. mode)
  end

  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")

  if start_pos[1] > end_pos[1] or (start_pos[1] == end_pos[1] and start_pos[2] > end_pos[2]) then
    start_pos, end_pos = end_pos, start_pos
  end

  local lines = vim.api.nvim_buf_get_text(0, start_pos[1] - 1, start_pos[2], end_pos[1] - 1, end_pos[2] + 1, {})
  return table.concat(lines, "\n")
end

local function escape_search(text)
  return "\\V" .. text:gsub("\\", "\\\\"):gsub("/", "\\/"):gsub("\n", "\\n")
end

local function escape_replace(text)
  return text:gsub("\\", "\\\\"):gsub("/", "\\/"):gsub("&", "\\&"):gsub("\n", "\\r")
end

map({"n", "o", "v"}, "H", "^", { desc = "Go to first non-whitespace character" })
map({"n", "o", "v"}, "L", "$", { desc = "Go to end of line" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected code up (and auto-indent them)" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected code down (and auto-indent them)" })

map("n", "J", "<C-d>zz", { desc = "scroll down half a page" })
map("n", "K", "<C-u>zz", { desc = "scroll up half a page" })

map("n", "<CR>", "mza<CR><Esc>`z", { desc = "Separate line after cursor to new line" })
map("n", "<BS>", "mzJ`z", { desc = "Join line without moving cursor" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "cc", '"_cc', { desc = "Change line without yanking" })
map({"n", "v"}, "c", '"_c', { desc = "Change without yanking" })
map("n", "C", '"_C', { desc = "Change to end of line without yanking" })

map("x", "p", "\"_dP")

map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace highlighted word"})
map("x", "<leader>sr", function()
  local selection = get_visual_selection()
  if selection == "" then
    return
  end

  local search = escape_search(selection)
  local replacement = escape_replace(selection)
  local command = (":%%s/%s/%s/gI"):format(search, replacement)
  local left = ("<Left>"):rep(3)

  vim.api.nvim_feedkeys(command .. vim.api.nvim_replace_termcodes(left, true, false, true), "n", false)
end, { desc = "Search and replace selection" })

map("x", "/", function()
  local selection = get_visual_selection()
  if selection == "" then
    return
  end

  local search = escape_search(selection)
  vim.fn.setreg("/", search)
  vim.opt.hlsearch = true
  vim.fn.search(search, "W")
end, { desc = "Search selection" })

map("n", "<leader>qq", ":qa<CR>", { desc = "Quit Neovim entirely" })

-- Better indenting - stay in visual mode after indenting
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Indent current line in normal mode (repeatable with . or just press >> again)
map("n", "<", "<<", { desc = "Indent line left" })
map("n", ">", ">>", { desc = "Indent line right" })
