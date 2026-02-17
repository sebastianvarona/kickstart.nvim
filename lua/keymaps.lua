-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Cheatsheet
local function cheatsheet()
  local cheatsheet_content = [[

                                    KEYMAPS CHEATSHEET

  ════════════════════════════════════════════════════════════════════════════════
   NAVIGATION
  ═══════════════════════════════════════════════════════════════════════════════
    Tab / S-Tab          Next / Prev buffer
    <C-h/j/k/l>          Navigate splits (tmux too)
    <C-d> / <C-u>        Half page down/up (centered)
    s                    Flash jump
    S                    Flash treesitter
    ]b / [b              Next / Prev buffer
    ]d / [d              Next / Prev diagnostic
    ]c / [c              Next / Prev git change

  ═══════════════════════════════════════════════════════════════════════════════
   SEARCH (Telescope)
  ═══════════════════════════════════════════════════════════════════════════════
    <leader><leader>     Find files
    <leader>,            Find buffers
    <leader>sf           Search files
    <leader>sg           Search by grep
    <leader>sw           Search word under cursor
    <leader>sd           Search diagnostics
    <leader>sh           Search help
    <leader>sk           Search keymaps
    <leader>sc           Search git commits
    <leader>sn           Search neovim config
    <leader>/            Search in current buffer
    <leader>R            Search and Replace (grug-far)

  ═══════════════════════════════════════════════════════════════════════════════
   LSP & CODE
  ═══════════════════════════════════════════════════════════════════════════════
    gd                   Go to definition
    gr                   Go to references
    gI                   Go to implementation
    gy                   Go to type definition
    grn                  Rename
    gra                  Code action
    <leader>cf           Format code

  ═══════════════════════════════════════════════════════════════════════════════
   GIT
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>gg           LazyGit
    <leader>hs           Stage hunk
    <leader>hr           Reset hunk
    <leader>hp           Preview hunk
    <leader>hb           Blame line
    <leader>tb           Toggle blame line

  ═══════════════════════════════════════════════════════════════════════════════
   HARPOON (Frequent files)
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>ha           Add file to harpoon
    <leader>hh           Harpoon menu
    <C-h>1-4             Jump to harpoon file 1-4

  ═══════════════════════════════════════════════════════════════════════════════
   BUFFERS & WINDOWS
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>bd           Delete buffer
    <leader>bo           Delete other buffers
    <leader>sv           Split vertical
    <leader>sh           Split horizontal
    <leader>sx           Close split

  ═══════════════════════════════════════════════════════════════════════════════
   EDITING
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>/            Comment
    <leader>y            Yank to clipboard
    <leader>p            Paste (no yank in visual)
    J / K (visual)       Move lines up/down
    jj / jk              Exit insert mode

  ═══════════════════════════════════════════════════════════════════════════════
   TEST & DATABASE
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>tt           Test nearest
    <leader>tf           Test file
    <leader>ts           Test suite
    <leader>db           DB UI
    <leader>rr           Rails restart (tmp/restart.txt)

  ═══════════════════════════════════════════════════════════════════════════════
   TROUBLE & DIAGNOSTICS
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>xx           Trouble diagnostics
    <leader>q            Quickfix list

  ═══════════════════════════════════════════════════════════════════════════════
   TOGGLES
  ═══════════════════════════════════════════════════════════════════════════════
    <leader>tc           Toggle colorizer
    <leader>th           Toggle inlay hints
    <leader>tb           Toggle git blame

  ═══════════════════════════════════════════════════════════════════════════════
   FILES (Oil)
  ═══════════════════════════════════════════════════════════════════════════════
    -                    Open parent directory
    <leader>o            Open directory
    <leader>oh           Toggle hidden files

  ═══════════════════════════════════════════════════════════════════════════════
   TERMINAL
  ═══════════════════════════════════════════════════════════════════════════════
    <C-t>                Toggle terminal
    <Esc><Esc>           Exit terminal mode

]]

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(cheatsheet_content, '\n'))
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'filetype', 'cheatsheet')

  local width = math.min(90, vim.o.columns - 4)
  local height = math.min(55, vim.o.lines - 4)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
    title = ' Cheatsheet ',
    title_pos = 'center',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal,FloatBorder:FloatBorder')
  vim.api.nvim_win_set_option(win, 'cursorline', false)

  local close_buf = vim.api.nvim_create_autocmd({ 'BufLeave', 'BufWipeout' }, {
    buffer = buf,
    callback = function()
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
  })

  vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true })
  vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', { buffer = buf, silent = true })
end

vim.keymap.set('n', '<leader>?', cheatsheet, { desc = 'Cheatsheet' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up centered' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search centered' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines keeping cursor' })

-- Move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to clipboard' })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Quickfix/loclist navigation
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'Prev quickfix' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>', { desc = 'Prev loclist' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>', { desc = 'Next loclist' })

-- Buffer keymaps
vim.keymap.set('n', '<leader>bb', '<cmd>e #<CR>', { desc = 'Switch to other buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '[B', '<cmd>bfirst<CR>', { desc = 'First buffer' })
vim.keymap.set('n', ']B', '<cmd>blast<CR>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete(0, false) end, { desc = '[D]elete buffer' })
vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end, { desc = '[D]elete buffer (force)' })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<CR>', { desc = 'Delete other buffers' })

-- Buffer navigation with TAB
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })

-- Splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal splits' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close split' })

-- Format with conform
vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = '[C]ode [F]ormat' })

-- Rails restart
vim.keymap.set('n', '<leader>rr', function()
  local root = vim.fn.finddir('.git/..', vim.fn.expand '%:p:h' .. ';')
  if root == '' then
    root = vim.fn.getcwd()
  end
  local restart_file = root .. '/tmp/restart.txt'
  vim.fn.system('mkdir -p ' .. root .. '/tmp && touch ' .. restart_file)
  vim.notify('Server restart triggered', vim.log.levels.INFO, { title = 'Rails' })
end, { desc = '[R]ails [R]estart' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Escape from insert mode using jj and jk
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode with jj' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode with jk' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows and tmux panes
--  Handled by vim-tmux-navigator plugin

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
