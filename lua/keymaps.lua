local map = vim.keymap.set

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

map("n", "<leader>qq", ":qa<CR>", { desc = "Quit Neovim entirely" })

-- Better indenting - stay in visual mode after indenting
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Indent current line in normal mode (repeatable with . or just press >> again)
map("n", "<", "<<", { desc = "Indent line left" })
map("n", ">", ">>", { desc = "Indent line right" })
