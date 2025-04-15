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
    sources = {
      'filesystem',
    },
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
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
        show_hidden_count = false, -- when true, the number of hidden items in each folder will be shown as the last entry
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          '.ds_store',
          'thumbs.db',
          --"node_modules",
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json"
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        always_show_by_pattern = { -- uses glob style patterns
          --".env*",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".ds_store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  },
}
