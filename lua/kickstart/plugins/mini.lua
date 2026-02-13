return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Delete buffers without messing up window layout
      require('mini.bufremove').setup()

      -- Indent scope with smooth animations
      require('mini.indentscope').setup {
        symbol = '│',
        options = {
          try_as_border = true,
        },
        draw = {
          animation = require('mini.indentscope').gen_animation.quadratic({ duration = 15, unit = 'step' }),
          delay = 100,
        },
      }

      -- Statusline disabled in favor of lualine.nvim
      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
