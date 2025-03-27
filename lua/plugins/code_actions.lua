---@type LazySpec[]
return {
  {
    'aznhe21/actions-preview.nvim',
    opts = {
      highlight_command = {
        require('actions-preview.highlight').diff_so_fancy(),
        require('actions-preview.highlight').delta('delta --no-gitconfig --side-by-side'),
      },
      backend = { 'snacks', 'telescope', 'nui' },
      ---@module 'snacks'
      ---@type snacks.picker.Config
      snacks = {
        layout = { preset = 'default' },
      },
    }
  },
}
