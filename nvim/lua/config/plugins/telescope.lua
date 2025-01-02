return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy"
					}
				},
				extensions = {
					fzf = {}
				}
			}

			require('telescope').load_extension('fzf')

			vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
			vim.keymap.set("n", "<space>fg", require('telescope.builtin').grep_string)
			vim.keymap.set("n", "<space>en", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
			vim.keymap.set("n", "<space>ep", function()
				require('telescope.builtin').find_files {
					---@diagnostic disable-next-line: param-type-mismatch
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
				}
			end)

			require "config.telescope.multigrep".setup()
		end
	}
}