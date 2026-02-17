return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      mapping = false,
      toggler = {
        line = '<leader>/',
        block = '<leader>cb',
      },
      opleader = {
        line = '<leader>/',
        block = '<leader>cb',
      },
    },
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = { '*' },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = 'background',
        tailwind = true,
        sass = { enable = true, parsers = { 'css' } },
        virtualtext = '■',
      },
      buftypes = {},
    },
    keys = {
      { '<leader>tc', '<cmd>ColorizerToggle<CR>', desc = '[T]oggle [C]olorizer' },
    },
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ha', function() require('harpoon'):list():add() end, desc = '[H]arpoon [A]dd file' },
      { '<leader>hh', function() local h = require('harpoon') h.ui:toggle_quick_menu(h:list()) end, desc = '[H]arpoon menu' },
      { '<leader>h1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon file 1' },
      { '<leader>h2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon file 2' },
      { '<leader>h3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon file 3' },
      { '<leader>h4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon file 4' },
      { '<C-h>1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon 1' },
      { '<C-h>2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon 2' },
      { '<C-h>3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon 3' },
      { '<C-h>4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon 4' },
    },
    opts = {},
  },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', ':LazyGit<CR>', desc = 'Open LazyGit' },
    },
  },

  {
    'MagicDuck/grug-far.nvim',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim' },
    keys = {
      { '<leader>R', ':GrugFar<CR>', desc = 'Search and [R]eplace' },
    },
    opts = {},
  },

  {
    'vim-test/vim-test',
    ft = { 'ruby', 'eruby' },
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
      vim.g['test#ruby#rspec#options'] = { '--format', 'documentation' }
    end,
    keys = {
      { '<leader>tt', ':TestNearest<CR>', desc = 'Run nearest test' },
      { '<leader>tf', ':TestFile<CR>', desc = 'Run test file' },
      { '<leader>ts', ':TestSuite<CR>', desc = 'Run test suite' },
    },
  },

  {
    'tpope/vim-rails',
    ft = { 'ruby', 'eruby' },
  },

  {
    'tpope/vim-bundler',
    ft = { 'ruby', 'eruby' },
  },

  {
    'tpope/vim-dadbod',
    ft = { 'sql' },
  },

  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
    },
    keys = {
      { '<leader>db', ':DBUI<CR>', desc = 'Open DB UI' },
      { '<leader>dq', ':DBUIToggle<CR>', desc = 'Toggle DB UI' },
    },
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        ruby = { 'standardrb' },
        typescript = { 'eslint' },
        typescriptreact = { 'eslint' },
        javascript = { 'eslint' },
        javascriptreact = { 'eslint' },
      },
    },
  },

  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>o', ':Oil<CR>', desc = 'Open parent directory' },
      { '-', ':Oil<CR>', desc = 'Open parent directory' },
      { '_', ':Oil --float<CR>', desc = 'Open parent directory (float)' },
      {
        '<leader>oh',
        function()
          require('oil').toggle_hidden()
        end,
        desc = 'Toggle hidden files',
      },
    },
    opts = {
      columns = {
        'icon',
      },
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      keymaps_help = {
        border = 'rounded',
      },
      view_options = {
        show_hidden = false,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      float = {
        padding = 2,
        max_width = 80,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 10,
        },
      },
    },
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    },
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        close_command = 'bdelete',
        right_mouse_command = 'bdelete!',
        left_mouse_command = 'buffer',
        middle_mouse_command = 'bdelete!',
        indicator = { style = 'icon', icon = '▎' },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = 'slant',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
      },
    },
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
    },
    opts = {},
  },

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-t>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  {
    'christopher-francisco/tmux-status.nvim',
    lazy = true,
    opts = {
      window = {
        separator = '│',
        text = 'name',
        icon_zoom = '',
        icon_mark = '',
        icon_bell = '',
        icon_mute = '',
        icon_activity = '',
      },
      session = {
        icon = '',
      },
      datetime = {
        icon = '',
        format = '%H:%M',
      },
      colors = {
        window_active = '#8aadf4',
        window_inactive = '#5b6078',
        window_inactive_recent = '#363a4f',
        session = '#a6da95',
        datetime = '#cad3f5',
      },
      manage_tmux_status = false,
    },
  },
}
