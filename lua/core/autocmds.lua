local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

---@param name string
---@param opts? vim.api.keyset.create_augroup
---@return integer
local function user_group(name, opts)
  opts = opts or {}
  return vim.api.nvim_create_augroup('seleneovim.' .. name, opts)
end

local relnum_group = user_group('relnums.toggle')

-- Toggle relative numbers on and off
autocmd({ 'BufEnter', 'FocusGained', 'WinEnter' }, {
  group = relnum_group,
  desc = 'Toggle relative line numbers on',
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = true
    end
  end,
})

autocmd({ 'BufLeave', 'FocusLost', 'WinLeave' }, {
  group = relnum_group,
  desc = 'Toggle relative line numbers off',
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = false
    end
  end,
})

autocmd({ 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
  callback = function(args)
    if vim.fn.getline(1) == '#!/usr/bin/env julia' then
      vim.cmd('setfiletype julia')
    end
  end,
})

autocmd('FileType', {
  group = user_group('quickquit'),
  pattern = {
    'checkhealth',
    'help',
    'lspinfo',
    'man',
    'mason',
    'noice',
    'nofile',
    'notify',
    'qf',
    'query',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    map('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

autocmd('FileType', {
  group = user_group('ccc.autotoggle'),
  pattern = { 'css', 'sass', 'sugarss', 'scss', 'postcss', 'stylus' },
  once = true,
  callback = function()
    require('ccc.highlighter'):enable()
  end,
})

autocmd('TextYankPost', {
  group = augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 2000, priority = 1000 })
  end,
})

autocmd('VimResized', {
  group = user_group('autoresize'),
  pattern = '*',
  callback = function()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. vim.fn.tabpagenr())
  end,
  desc = 'Resize buffers when nvim is resized.',
})

autocmd('Filetype', {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= '' then
      return
    end
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      vim.notify_once('No treesitter config found for "' .. ft .. '" filetype', vim.log.levels.WARN, {})
      return
    end

    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
    end
  end,
})

autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').crystal = {
      install_info = {
        url = 'https://github.com/crystal-lang-tools/tree-sitter-crystal',
        branch = 'main',
        queries = 'queries/nvim',
      },
      tier = 2,
    }
  end,
})
