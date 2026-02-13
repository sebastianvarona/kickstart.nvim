return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local colors = {
      bg = '#1e2030',
      fg = '#cad3f5',
      blue = '#8aadf4',
      green = '#a6da95',
      yellow = '#eed49f',
      red = '#ed8796',
      magenta = '#c6a0f6',
      cyan = '#91d7e3',
      gray = '#363a4f',
      black = '#24273a',
    }

    local config = {
      options = {
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        theme = 'auto',
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
            color = { fg = colors.magenta },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = { modified = '*', readonly = '', unnamed = '[No Name]' },
            color = { fg = colors.fg },
          },
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            colored = false,
            padding = { left = 0, right = 1 },
          },
          {
            'filetype',
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
        },
        lualine_y = {
          {
            'progress',
            color = { fg = colors.gray },
          },
        },
        lualine_z = {
          {
            'location',
            padding = { left = 1, right = 1 },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = { modified = '*', readonly = '', unnamed = '[No Name]' },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            mode = 2,
            buffers_color = {
              active = { fg = colors.bg, bg = colors.blue },
              inactive = { fg = colors.gray, bg = colors.black },
            },
            symbols = { modified = ' ', alternate_file = '' },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    }

    require('lualine').setup(config)
  end,
}
