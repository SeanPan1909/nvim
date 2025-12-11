return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    opts = {},
    config = function(_, opts)
      local mc = require("multicursor-nvim")
      mc.setup(opts)
          mc.addKeymapLayer(function(layerSet)

              layerSet({"n", "x"}, "<left>", mc.prevCursor)
              layerSet({"n", "x"}, "<right>", mc.nextCursor)

              layerSet("n", "<esc>", function()
                  if not mc.cursorsEnabled() then
                      mc.enableCursors()
                  else
                      mc.clearCursors()
                  end
              end)
          end)
      end,
      keys = function()
        local mc = require("multicursor-nvim")
        
        return {
          {"<leader>n", function() mc.matchAddCursor(1) end, desc = "Add matching text cursor"},
          {"<leader>N", function() mc.matchAddCursor(-1) end, desc = "Remove matching text cursor"},

          {"<c-leftmouse>", mc.handleMouse},
          {"<c-leftdrag>", mc.handleMouseDrag},
          {"<c-leftrelease>", mc.handleMouseRelease},
        }
    end
}
