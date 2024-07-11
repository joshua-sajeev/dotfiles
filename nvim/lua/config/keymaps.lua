local keymap = vim.keymap
keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', { desc = 'Open file explorer' })
keymap.set('n', '<leader><leader>', '<cmd>bNext<CR>', { desc = 'Open file explorer' })
keymap.set('n', '<leader>q', '<cmd>bdelete<CR>', { desc = 'Open file explorer' })

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
-- keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', { desc = 'Open file explorer' })
keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap.set({ 'n', 't' }, '<A-]>', '<cmd>ToggleTerm<CR>')
-- Exit terminal mode in the builtin terminal
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
