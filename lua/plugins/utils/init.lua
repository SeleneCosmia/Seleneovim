return {
  { require 'plugins.utils.folds' },
  { require 'plugins.utils.web_dev' },

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
    opts = {}
  },

  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {}
  },

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                       Misc Utils                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'Zeioth/hot-reload.nvim',
    event = 'BufEnter',
    opts = {}
  },

  {
    'lambdalisue/suda.vim',
    cmd = { 'SudaWrite', 'SudaRead' },
    keys = {
      { '<leader>sw', '<cmd>SudaWrite<cr>', { desc = '[S]udo [W]rite' } },
    },
    config = function()
      vim.g.suda_smart_edit = 1
    end,
  },

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                        Git Utils                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  {
    'SuperBo/fugit2.nvim',
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2GRaph' },
    keys = {
      { '<leader>fg', '<cmd>Fugit2<cr>', { desc = 'Open [F]u[G]it2 Floating Window' }},
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      content_width = 92,
      width = math.floor(0.75 * vim.o.columns),
      height = '75%',
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

  {
    'Cassin01/wf.nvim',
    version = false,
    config = function()
      require 'wf'.setup()
    end,
  },

  {
    'sustech-data/wildfire.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require 'wildfire'.setup()
    end,
  },

  {
    'chrishrb/gx.nvim',
    keys = {
      { 'gx', '<cmd>Browse<cr>', mode = {'n','x'}},
    },
    cmd = 'Browse',
    init = function()
      vim.g.netrw_nogx = 1
    end,
    opts = {}
  },

  {
    'utilyre/sentiment.nvim',
    version = false,
    event = 'BufReadPost',
    opts = {},
    init = function()
      vim.g.loaded_matchparen = 1
    end,
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

  -- {
  --   'lsvmello/elastictabstops.nvim',
  --   cmd = { 'ElasticTabstopsEnable', 'ElasticTabstopsDisable' },
  --   config = function()
  --     require 'elastictabstops'.setup()
  --   end,
  -- },

  { 'b0o/SchemaStore.nvim', version = false },
}
