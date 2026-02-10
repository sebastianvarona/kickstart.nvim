return {
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
      { '<leader>sr', ':GrugFar<CR>', desc = '[S]earch and [R]eplace' },
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
}
