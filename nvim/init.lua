require("config.lazy")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
require("config.keymaps")
require("config.options")
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
