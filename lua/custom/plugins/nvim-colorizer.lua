return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = { -- set to setup table
    filetypes = {
      'html',
      'css',
      'javascript',
    },
    user_default_option = {
      names = false,
    },
  },
}
