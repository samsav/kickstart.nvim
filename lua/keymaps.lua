-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Custom remaps ]]
--
-- Open Oil in current working directory
-- vim.keymap.set('n', '<leader>co', '<CMD>Oil --float<CR>', { desc = 'Open Oil in current working directory' })

-- Unload current buffer
vim.keymap.set('n', '<leader>bd', '<CMD>bdelete<CR>', { desc = 'Close current buffer' })

-- Remaps for a 🇫🇮🇸🇪🇳🇴🇩🇰🇮🇸 keyboard where ö/ø and ä/æ are just sitting
-- there on the home row, smoking cigarettes and looking cool but taking up
-- prime real estate that we can put to better use
-- TODO: add c and y, refactor to a loop that sets the keymaps?
vim.keymap.set({ 'n', 'v' }, 'ö', '^', { desc = 'Go to first non-blank character of the line' })
vim.keymap.set({ 'n', 'v' }, 'ä', '$', { desc = 'Go to the end of the line' })
vim.keymap.set({ 'n', 'v' }, 'gö', 'g^', { desc = 'Go to first non-blank character on screen line' })
vim.keymap.set({ 'n', 'v' }, 'gä', 'g$', { desc = 'Go to last non-blank character on screen line' })
vim.keymap.set({ 'n', 'v' }, 'dö', 'd^', { desc = 'Delete to first non-blank character of the line' })
vim.keymap.set({ 'n', 'v' }, 'dä', 'd$', { desc = 'Delete to end of the line' })

-- "greatest remap ever", from https://github.com/ThePrimeagen/init.lua
-- When pasting over highlighted content, delete that content into the void register
-- and preserve the current paste buffer.
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Delete into the void register
vim.keymap.set({ 'n', 'v' }, '<leader>dv', '"_d', { desc = 'Delete into void register' })

-- Search and replace shortcuts
-- vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace current word' })
vim.keymap.set({ 'n', 'x' }, '<localleader>rr', function()
  require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } }
end, { desc = 'Search and replace current word' })

vim.keymap.set({ 'n', 'x' }, '<leader>si', function()
  require('grug-far').open { visualSelectionUsage = 'operate-within-range' }
end, { desc = 'grug-far: Search within range' })

vim.keymap.set({ 'n', 'x' }, '<leader>ss', function()
  local search = vim.fn.getreg '/'
  -- surround with \b if "word" search (such as when pressing `*`)
  if search and vim.startswith(search, '\\<') and vim.endswith(search, '\\>') then
    search = '\\b' .. search:sub(3, -3) .. '\\b'
  end
  require('grug-far').open {
    prefills = {
      search = search,
    },
  }
end, { desc = 'grug-far: Search using @/ register value or visual selection' })

-- Make current file executable
vim.keymap.set('n', '<leader>xx', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })

-- Run current Lua file
vim.keymap.set('n', '<leader>xl', '<cmd>luafile %<CR>', { silent = true, desc = 'Run current Lua file' })

vim.keymap.set('n', '<C-w>z', '<CMD>ZenMode<CR>', { desc = 'Toggle Zen Mode' })

-- Aerial
vim.keymap.set('n', '<leader>ta', '<cmd>AerialToggle left<CR>', { desc = 'Toggle aerial window' })
vim.keymap.set('n', '¸', '<cmd>AerialNavToggle<CR>', { desc = 'Toggle aerial nav window' })

-- vim: ts=2 sts=2 sw=2 et
