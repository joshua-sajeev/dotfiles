local keymap = vim.keymap

keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
keymap.set('n', '<leader><leader>', '<cmd>bNext<CR>', { desc = 'Open file explorer' })
keymap.set("n", "<space>x", ":.lua<CR>")
keymap.set("v", "<space>x", ":lua<CR>")
keymap.set("n", "<space>pv", ":e %:p:h/<CR>")
keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
--
-- Split window
keymap.set("n", "ss", ":split<Return>", { desc = "split window horizontally" })
keymap.set("n", "sv", ":vsplit<Return>", { desc = "split window horizontally" })


-- Undo tree
keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
