return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
          end,
    keys = function()
      local harpoon = require("harpoon")
      return {
        {"<leader><CR>", function() harpoon:list():add() end, desc = "Add program to harpoon"},
        {"<leader><space>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Open harpoon ui"},
        {"<leader>1", function() harpoon:list():select(1) end, desc = "Switch to buffer on harpoon 1"},
        {"<leader>2", function() harpoon:list():select(2) end, desc = "Switch to buffer on harpoon 2"},
        {"<leader>3", function() harpoon:list():select(3) end, desc = "Switch to buffer on harpoon 3"},
        {"<leader>4", function() harpoon:list():select(4) end, desc = "Switch to buffer on harpoon 4"},
        {"<leader>5", function() harpoon:list():select(5) end, desc = "Switch to buffer on harpoon 5"},
        {"<leader>6", function() harpoon:list():select(6) end, desc = "Switch to buffer on harpoon 6"},
        {"<leader>7", function() harpoon:list():select(7) end, desc = "Switch to buffer on harpoon 7"},
        {"<leader>8", function() harpoon:list():select(8) end, desc = "Switch to buffer on harpoon 8"},
        {"<leader>9", function() harpoon:list():select(9) end, desc = "Switch to buffer on harpoon 9"},
        {"<leader>0", function() harpoon:list():select(10) end, desc = "Switch to buffer on harpoon 0"}
      }
    end
}
