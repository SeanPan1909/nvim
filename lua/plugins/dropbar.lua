return {
  "Bekaboo/dropbar.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    general = {
      enable = true,
      attach_events = {
        "BufEnter",
        "BufWinEnter",
        "CursorMoved",
        "InsertLeave",
      },
    },
    icons = {
      enable = true,
      kinds = {
        symbols = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
      ui = {
        bar = {
          separator = "  ",
          extends = "…",
        },
        menu = {
          separator = " ",
          indicator = "  ",
        },
      },
    },
    bar = {
      -- Show full path when hovering
      hover = true,

      -- Sources to display in the dropbar (in order)
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")

        if vim.bo[buf].ft == "markdown" then
          return {
            sources.path,
            sources.markdown,
          }
        end

        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end

        return {
          sources.path,
          utils.source.fallback({
            sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
    menu = {
      -- Keymaps for the menu
      keymaps = {
        ["<CR>"] = function()
          local menu = require("dropbar.api").get_current_dropbar_menu()
          if not menu then
            return
          end
          local cursor = vim.api.nvim_win_get_cursor(menu.win)
          local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
          if component then
            menu:click_on(component, nil, 1, "l")
          end
        end,
        ["<Esc>"] = function()
          local menu = require("dropbar.api").get_current_dropbar_menu()
          if menu then
            menu:close()
          end
        end,
        ["q"] = function()
          local menu = require("dropbar.api").get_current_dropbar_menu()
          if menu then
            menu:close()
          end
        end,
      },

      -- Quick navigation
      quick_navigation = true,

      -- Preview on hover
      preview = true,
    },
  },
  keys = {
    {
      "<leader>wp",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Pick from dropbar",
    },
  },
}
