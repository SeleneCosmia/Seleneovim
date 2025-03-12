local opts = {
  filetypes = {
    '*',
    '!checkhealth',
    '!lazy',
    '!mason',
    '!Mason',
    json = { css = false },
    sh = { css = false },
    cmp_menu = {
      always_update = true,
      css = true,
    },
    cmp_docs = {
      always_update = true,
      css = true,
    },
    markdown = {
      RGB = false,
      RRGGBB = true,
      always_update = true,
    },
  },
  user_default_options = {
    names_opts = {
      lowercase = true,
      camelcase = true,
      uppercase = true,
      strip_digits = false,
    },
    css = true,
    css_fn = true,
  },
  always_update = true,
  lazy_load = false,
}

---@type LazySpec[]
return {
  {
    'catgoose/nvim-colorizer.lua',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = opts
  }
}
