return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  -- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    local parsers = {
      'bash',
      'css',
      'csv',
      'diff',
      'go',
      'gomod',
      'html',
      'javascript',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'vim',
      'vimdoc',
    }

    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)
        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'

        -- enables treesitter based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
-- opts = {
--   ensure_installed = {
--     'bash',
--     'css',
--     'csv',
--     'diff',
--     'go',
--     'gomod',
--     'html',
--     'javascript',
--     'lua',
--     'luadoc',
--     'markdown',
--     'markdown_inline',
--     'python',
--     'query',
--     'vim',
--     'vimdoc',
--   },
--   -- Autoinstall languages that are not installed
--   auto_install = true,
--   highlight = {
--     enable = true,
--     -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--     --  If you are experiencing weird indenting issues, add the language to
--     --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--     additional_vim_regex_highlighting = { 'ruby' },
--   },
--   indent = { enable = true, disable = { 'ruby' } },
--   -- :help nvim-treesitter-incremental-selection-mod
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = '<CR>',
--       scope_incremental = '<CR>',
--       node_incremental = '<TAB>',
--       node_decremental = '<S-TAB>',
--     },
--   },
-- },
