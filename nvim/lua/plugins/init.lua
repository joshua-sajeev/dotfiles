return {
	{ -- Undo tree
		'mbbill/undotree'
	},
	{ -- Colorscheme
		"folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end
	},
	{ -- Automatically add brackets
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require('nvim-autopairs').setup {}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
			local cmp = require 'cmp'
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{ -- Which key
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
