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
    dependencies = 'nvim-lua/plenary.nvim',
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
      'nvim-lua/plenary.nvim',
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
    dependencies = 'nvim-tree/nvim-web-devicons',
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
    config = function()
      require 'core.keymaps'
    end,
    opts = {
      { ignored_buftypes = { 'neo-tree' } },
      { resize_mode = { silent = true } },
    },
  },

  {
    'lsvmello/elastictabstops.nvim',
    cond = false,
    cmd = { 'ElasticTabstopsEnable', 'ElasticTabstopsDisable' },
    config = function()
      require 'elastictabstops'.setup()
    end,
  },

  { 'b0o/SchemaStore.nvim', version = false },

  -- nvim lua libraries

  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
}
