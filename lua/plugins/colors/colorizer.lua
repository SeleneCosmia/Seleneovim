local opts = {
  filetypes = {
    javascript = {
      css = false,
    },
    json = {
      css = false,
    },
    sh = {
      css = false,
    },
    mason = {
      css = false,
    },
    lazy = {
      RGB = false,
      css = false,
    },
    cmp_menu = {
      always_update = true,
      css = true,
    },
    cmp_docs = {
      always_update = true,
      css = true,
    },
    TelescopeResults = {
      RGB = false,
    },
    markdown = {
      RGB = false,
      RRGGBB = true,
      always_update = true,
    },
    checkhealth = {
      names = false,
    },
    Mason = {
      names = false,
    },
  },
  user_default_options = {
    names_opts = {
      lowercase = true,
      camelcase = true,
      uppercase = true,
      strip_digits = false,
    },
    names = true,
    RGB = true,
    RGBA = true,
    RRGGBB = true,
    RRGGBBAA = true,
    AARRGGBB = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
  },
  always_update = true,
  lazy_load = false,
}

return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = opts
  }
}
