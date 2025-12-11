local function file_status_indicator()
  if vim.bo.readonly then
    return ""
  elseif vim.bo.modified then
    return "●"
  else
    return ""
  end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin-macchiato',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        {
          file_status_indicator,
          padding = 2,
        }
      },
      lualine_c = { 
        {
          'filename',
          path = 1,
          color = { fg = '#f5c2e7', gui = 'bold' },
          padding = 2
        }
      },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {},
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' }, 
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}

