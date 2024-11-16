return {
    { 'mattn/emmet-vim' },
    { 'numToStr/Comment.nvim' },

    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
            vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
                { noremap = true })
        end
    },

    {
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
    {
        'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        config = function(_, opts)
            require('nvim-treesitter.install').prefer_git = true
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup(opts)
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },

    { 'nvim-treesitter/nvim-treesitter-context' },
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
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            direction = 'float'
            --[[ things you want to change go here]]
        }
    },
    { -- Undo History in a tree structure
        'mbbill/undotree'
    },
    { 'folke/which-key.nvim' },
    { --- catppuccin theme ---
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000, -- Make sure to load this before all the other start plugins.
        init = function()
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'catppuccin-storm', 'catppuccin-moon', or 'catppuccin-day'.
            vim.cmd.colorscheme 'catppuccin'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },

}
