return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  opts = {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    throttle = true,
    on_attach = nil,
    win_options = {
      winhighlight = 'Normal:TreesitterContext,CursorLine:TreesitterContextLine,CursorColumn:TreesitterContextColumn',
    },
  },
}
