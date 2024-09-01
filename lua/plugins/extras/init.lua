return {
  {
    'vhyrro/luarocks.nvim',
    priority = 11001,
    opts = {
      rocks = { 'magick', 'hsluv', 'warna' },
    },
  },
  {
    '3rd/image.nvim',
    dependencies = { 'luarocks.nvim' },
    enabled = function()
      if os.getenv('TERM_PROGRAM') == 'kitty' or 'WezTerm' then
        return true
      else
        return false
      end
    end,
    config = function(term)
      require 'image'.setup({})
    end,
  },
  { require 'plugins.extras.markdown' },
}
