local keymap = vim.keymap

-- Define opts (if you want to use it)
local opts = { noremap = true, silent = true }

-- Key mappings
keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", { desc = "Open file explorer" })

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Additional mappings
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the built-in terminal
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { desc = "Undo Tree Toggle" })
