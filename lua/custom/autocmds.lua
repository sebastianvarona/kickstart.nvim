-- [[ Custom Autocommands ]]

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Set colorcolumn at 120 for code files
autocmd('FileType', {
  pattern = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
    'ruby',
    'lua',
    'python',
    'html',
    'css',
  },
  group = augroup('colorcolumn_120', { clear = true }),
  callback = function()
    vim.opt_local.colorcolumn = '120'
  end,
})

-- Disable mini.indentscope for certain filetypes
autocmd('FileType', {
  pattern = {
    'NvimTree',
    'alpha',
    'dashboard',
    'help',
    'lazy',
    'lazyterm',
    'man',
    'mason',
    'notify',
    'oil',
    'qf',
    'query',
    'terminal',
    'trouble',
    'TelescopePrompt',
    'checkhealth',
    'neo-tree',
    'neo-tree-popup',
  },
  group = augroup('disable_indentscope', { clear = true }),
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

-- guess-indent.nvim automatically detects and applies indentation settings
-- for all file types, including TypeScript and TSX

-- vim: ts=2 sts=2 sw=2 et
