-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ', Down = '<Down> ', Left = '<Left> ', Right = '<Right> ',
          C = '<C-…> ', M = '<M-…> ', D = '<D-…> ', S = '<S-…> ',
          CR = '<CR> ', Esc = '<Esc> ', ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ', NL = '<NL> ', BS = '<BS> ',
          Space = '<Space> ', Tab = '<Tab> ',
          F1 = '<F1>', F2 = '<F2>', F3 = '<F3>', F4 = '<F4>', F5 = '<F5>',
          F6 = '<F6>', F7 = '<F7>', F8 = '<F8>', F9 = '<F9>', F10 = '<F10>',
          F11 = '<F11>', F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>?', desc = 'Cheatsheet', icon = ' ' },
        { '<leader>D', desc = 'Dashboard', icon = ' ' },

        { '<leader>', group = 'Leader', icon = ' ' },
        { '<leader><leader>', desc = 'Find files', icon = ' ' },
        { '<leader>,', desc = 'Find buffers', icon = ' ' },

        { '<leader>b', group = '[B]uffer', icon = ' ' },
        { '<leader>bb', desc = 'Switch buffer' },
        { '<leader>bd', desc = 'Delete buffer' },
        { '<leader>bD', desc = 'Delete buffer (force)' },
        { '<leader>bo', desc = 'Delete other buffers' },

        { '<leader>c', group = '[C]ode', icon = ' ' },
        { '<leader>cf', desc = 'Format code' },
        { '<leader>ca', desc = 'Code actions (file)' },

        { '<leader>d', group = '[D]atabase', icon = ' ' },

        { '<leader>g', group = '[G]it', icon = ' ' },
        { '<leader>gg', desc = 'LazyGit' },

        { '<leader>h', group = 'Git [H]unk / [H]arpoon', icon = ' ', mode = { 'n', 'v' } },
        { '<leader>ha', desc = 'Harpoon add' },
        { '<leader>hh', desc = 'Harpoon menu' },
        { '<leader>h1', desc = 'Harpoon 1' },
        { '<leader>h2', desc = 'Harpoon 2' },
        { '<leader>h3', desc = 'Harpoon 3' },
        { '<leader>h4', desc = 'Harpoon 4' },
        { '<leader>hs', desc = 'Stage hunk' },
        { '<leader>hr', desc = 'Reset hunk' },
        { '<leader>hp', desc = 'Preview hunk' },
        { '<leader>hb', desc = 'Blame line' },
        { '<leader>hd', desc = 'Diff' },

        { '<leader>o', group = '[O]il', icon = ' ' },
        { '<leader>o', desc = 'Open directory' },
        { '<leader>oh', desc = 'Toggle hidden' },

        { '<leader>R', desc = 'Search and Replace', icon = ' ' },

        { '<leader>s', group = '[S]earch', icon = ' ' },
        { '<leader>sf', desc = 'Files' },
        { '<leader>sg', desc = 'Grep' },
        { '<leader>sw', desc = 'Word' },
        { '<leader>sd', desc = 'Diagnostics' },
        { '<leader>sc', desc = 'Commits' },
        { '<leader>sb', desc = 'Branches' },
        { '<leader>sr', desc = 'Resume' },
        { '<leader>sn', desc = 'Neovim config' },
        { '<leader>sh', desc = 'Help' },
        { '<leader>sk', desc = 'Keymaps' },

        { '<leader>t', group = '[T]oggle/Test', icon = ' ' },
        { '<leader>tt', desc = 'Test nearest' },
        { '<leader>tf', desc = 'Test file' },
        { '<leader>ts', desc = 'Test suite' },
        { '<leader>th', desc = 'Inlay hints' },
        { '<leader>tb', desc = 'Git blame' },
        { '<leader>tc', desc = 'Colorizer' },

        { '<leader>x', group = 'Trouble', icon = ' ' },
        { '<leader>xx', desc = 'Diagnostics' },
        { '<leader>xX', desc = 'Buffer diagnostics' },

        { '<leader>y', desc = 'Yank to clipboard', icon = ' ' },
        { '<leader>Y', desc = 'Yank line to clipboard' },

        { '<leader>r', group = '[R]ails', icon = ' ' },
        { '<leader>rr', desc = 'Restart server' },

        { '<leader>sv', desc = 'Split vertical' },
        { '<leader>sh', desc = 'Split horizontal' },
        { '<leader>se', desc = 'Equal splits' },
        { '<leader>sx', desc = 'Close split' },

        { '[', group = 'Prev' },
        { ']', group = 'Next' },
        { '[b', desc = 'Buffer' },
        { ']b', desc = 'Buffer' },
        { '[d', desc = 'Diagnostic' },
        { ']d', desc = 'Diagnostic' },
        { '[c', desc = 'Git change' },
        { ']c', desc = 'Git change' },
        { '[q', desc = 'Quickfix' },
        { ']q', desc = 'Quickfix' },
        { '[l', desc = 'Loclist' },
        { ']l', desc = 'Loclist' },

        { 'g', group = 'Goto' },
        { 'gd', desc = 'Definition' },
        { 'gr', desc = 'References' },
        { 'gI', desc = 'Implementation' },
        { 'gy', desc = 'Type definition' },
        { 'gD', desc = 'Declaration' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
