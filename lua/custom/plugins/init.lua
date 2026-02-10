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
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        ruby = { 'standardrb' },
      },
    },
  },

  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>o', ':Oil<CR>', desc = 'Open parent directory' },
    },
    opts = {},
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
