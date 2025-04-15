-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal float<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      mappings = {
        ['<space>'] = {
          'toggle_node',
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ['<2-LeftMouse>'] = 'open',
        ['<cr>'] = 'open',
        -- ["<cr>"] = { "open", config = { expand_nested_files = true } }, -- expand nested file takes precedence
        ['<esc>'] = 'cancel', -- close preview or floating neo-tree window
        ['<C-p>'] = {
          'toggle_preview',
          config = {
            use_float = true,
            use_image_nvim = false,
            -- title = "Neo-tree Preview", -- You can define a custom title for the preview floating window.
          },
        },
        ['<C-f>'] = { 'scroll_preview', config = { direction = -10 } },
        ['<C-b>'] = { 'scroll_preview', config = { direction = 10 } },
        ['l'] = 'focus_preview',
        ['<C-h>'] = 'open_split',
        ['<C-s>'] = 'open_vsplit',
        ['<C-t>'] = 'open_tabnew',
        ['w'] = 'open_with_window_picker',
        ['C'] = 'close_node',
        ['z'] = 'close_all_nodes',
        ['Z'] = 'expand_all_nodes',
        ['R'] = 'refresh',
        ['a'] = {
          'add',
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = 'none', -- "none", "relative", "absolute"
          },
        },
        ['A'] = 'add_directory', -- also accepts the config.show_path and config.insert_as options.
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy', -- takes text input for destination, also accepts the config.show_path and config.insert_as options
        ['m'] = 'move', -- takes text input for destination, also accepts the config.show_path and config.insert_as options
        ['e'] = 'toggle_auto_expand_width',
        ['q'] = 'close_window',
        ['?'] = 'show_help',
        ['<'] = 'prev_source',
        ['>'] = 'next_source',
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
