---@type LazySpec[]
return {
  { require 'plugins.utils.web_dev' },
  { require 'plugins.utils.editing' },

  {
    'kevinhwang91/nvim-ufo',
    version = false,
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.opt.foldcolumn = '1'
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      local ufo = require 'ufo'
      ufo.setup({
        ---@diagnostic disable-next-line
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      })
    end,
  },
  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃                 Terminal Related Utils                  ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'RAprogramm/nekifoch',
    cmd = 'Nekifoch',
    cond = function()
      if os.getenv('TERM') == 'xterm-kitty' then
        return true
      else
        return false
      end
    end,
    opts = {},
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    version = '*',
    opts = {},
  },

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃                       Misc Utils                        ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'Zeioth/hot-reload.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'BufEnter',
    opts = function(_, opts)
      local lua_dir = vim.fn.stdpath('config') .. '/lua'
      local plugins = lua_dir .. '/plugins/'

      opts.reload_files = {
        plugins .. 'snacks.lua',
        plugins .. 'completions.lua',
      }
    end,
  },

  {
    'lambdalisue/suda.vim',
    cmd = { 'SudaWrite', 'SudaRead' },
    keys = {
      { '<leader>sw', '<cmd>SudaWrite<cr>', { desc = '[S]udo [W]rite' } },
    },
  },

  --  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  --  ┃                Movement Related Plugins                 ┃
  --  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'max397574/better-escape.nvim',
    version = 'v1.0.0',
    event = 'InsertEnter',
    opts = {},
  },

  { 'chrisgrieser/nvim-spider', lazy = true },

  --  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  --  ┃                     Comment Plugins                     ┃
  --  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'LudoPinelli/comment-box.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'numToStr/Comment.nvim',
    lazy = true,
    opts = {},
  },

  -- ──────────────────────────────────────────────────────────────────────

  {
    'Cassin01/wf.nvim',
    version = false,
    opts = {},
  },

  {
    'sustech-data/wildfire.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  {
    'chrishrb/gx.nvim',
    cmd = 'Browse',
    keys = {
      { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } },
    },
    opts = {},
  },

  {
    'utilyre/sentiment.nvim',
    version = false,
    event = 'BufReadPost',
    opts = {},
  },

  {
    'mrjones2014/smart-splits.nvim',
    version = false,
    event = 'BufEnter',
    opts = {
      { ignored_buftypes = { 'neo-tree' } },
      { resize_mode = { silent = true } },
    },
  },

  {
    'nvimtools/hydra.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.hydra'
    end,
  },

  { 'b0o/schemastore.nvim' },
}
