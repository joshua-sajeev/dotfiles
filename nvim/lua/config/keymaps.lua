local keymap = vim.keymap


vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', { desc = 'Open file explorer' })
keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap.set({'n','t'},'<A-]>','<cmd>ToggleTerm<CR>')
-- Exit terminal mode in the builtin terminal
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind Files" })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live [G]rep" })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[B]uffers" })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[H]elp Tags" })

