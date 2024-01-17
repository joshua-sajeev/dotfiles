return {
    {
        { "lukas-reineke/indent-blankline.nvim", main = "ibl",
        config = function()
            require("ibl").setup({
            scope = {
                show_start = false,
            },
            indent = {
                char = "|",
                -- smart_indent_cap = true,
            },

            })
        end
        }
    },
    {
        "HiPhish/nvim-ts-rainbow2",

        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    -- list of languages you want to disable the plugin for
                    disable = { 'jsx', 'cpp' },
                    -- Which query to use for finding delimiters
                    query = 'rainbow-parens',
                    -- Highlight the entire buffer all at once
                    strategy = require('ts-rainbow').strategy.global,
                }
            }
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {"numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require('Comment').setup()
    end},
    {
        'nvim-lua/plenary.nvim',
       name = "plenary"
    },



    {
        'akinsho/toggleterm.nvim', version = "*",
        opts = {
            direction = 'float',
            open_mapping = [[<c-\>]],
            --autochdir = true,
        },
    },


    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
        vim.cmd([[colorscheme catppuccin]])
    end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
