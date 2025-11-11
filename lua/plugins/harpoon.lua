return {
  "ThePrimeagen/harpoon",
  keys = {
    -- Disable <leader>h and <leader>H keymaps
    { "<leader>h", false },
    { "<leader>H", false },

    -- Harpoon keymaps
    { "<leader><cr>", function() require("harpoon"):list():add() end, desc = "Add file to harpoon" },
    { "<leader><leader>", function() local harpoon = require("harpoon"); harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle harpoon menu" },
  },
}
