local keymap = vim.keymap

-- Define opts (if you want to use it)
local opts = { noremap = true, silent = true }

-- Key mappings
keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', { desc = 'Open file explorer' })
keymap.set('n', '<leader><leader>', '<cmd>bNext<CR>', { desc = 'Next buffer' })
keymap.set('n', '<leader>q', '<cmd>bdelete<CR>', { desc = 'Close buffer' })

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Save file and quit
keymap.set('n', '<Leader>w', ':update<Return>', opts)
keymap.set('n', '<Leader>Q', ':qa<Return>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- Additional mappings
keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Terminal mappings
keymap.set({ 'n', 't' }, '<A-]>', '<cmd>ToggleTerm<CR>')

-- Exit terminal mode in the built-in terminal
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
