return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = {
      border = "curved",
      width = function()
        return math.floor(vim.o.columns * 0.9)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.9)
      end,
      winblend = 0,
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return string.format("%d:%s", term.id, term.name or term.cmd)
      end,
    },
  },
  keys = {
    -- Toggle floating terminal
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float", mode = { "n", "t" } },

    -- Toggle horizontal terminal
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal", mode = { "n", "t" } },

    -- Toggle vertical terminal
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal Vertical", mode = { "n", "t" } },

    -- Terminal selector - THIS IS THE KEY FEATURE YOU WANT
    { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal", mode = { "n", "t" } },

    -- Specific terminals (1-4)
    { "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1", mode = { "n", "t" } },
    { "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2", mode = { "n", "t" } },
    { "<leader>t3", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3", mode = { "n", "t" } },
    { "<leader>t4", "<cmd>4ToggleTerm<cr>", desc = "Terminal 4", mode = { "n", "t" } },

    -- Toggle all terminals
    { "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals", mode = { "n", "t" } },

    -- Send lines to terminal
    { "<leader>tl", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send Line to Terminal", mode = "n" },
    { "<leader>tl", "<cmd>ToggleTermSendVisualSelection<cr>", desc = "Send Selection to Terminal", mode = "v" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Better terminal navigation
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to left window" })
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to down window" })
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to up window" })
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to right window" })
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Window commands" })

    -- Terminal window resizing
    vim.keymap.set("t", "<A-Up>", [[<Cmd>resize +2<CR>]], { desc = "Increase window height" })
    vim.keymap.set("t", "<A-Down>", [[<Cmd>resize -2<CR>]], { desc = "Decrease window height" })
    vim.keymap.set("t", "<A-Left>", [[<Cmd>vertical resize -2<CR>]], { desc = "Decrease window width" })
    vim.keymap.set("t", "<A-Right>", [[<Cmd>vertical resize +2<CR>]], { desc = "Increase window width" })

    -- Also add resize in normal mode for consistency
    vim.keymap.set("n", "<A-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
    vim.keymap.set("n", "<A-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
    vim.keymap.set("n", "<A-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
    vim.keymap.set("n", "<A-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

    -- ESC to exit terminal mode
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
  end,
}
