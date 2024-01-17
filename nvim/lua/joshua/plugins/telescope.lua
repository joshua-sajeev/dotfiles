return{
        "nvim-telescope/telescope.nvim",tag = '0.1.5',


        -- Do Not
        -- Do
        -- Do NOT
        lazy = false,
        dependencies = {
            "plenary",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
--            "debugloop/telescope-undo.nvim",
        },

        config = function()
            require("telescope").setup()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n','<leader>pWs',function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({search = word })
            end)
            vim.keymap.set('n','<leader>pws',function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({search = word })
            end)
        end,
        keys = {
            {
                "<leader>ff",
                "<cmd>Telescope find_files<cr>",
                desc = "find files",
            },
            {
                "<leader>fg",
                "<cmd>Telescope live_grep<cr>",
                desc = "live grep"
            },
            {
                "<leader>fb",
                "<cmd>Telescope buffers<cr>",
                desc = "buffers"
            },
            {
                "<leader>fh",
                "<cmd>Telescope help_tags<cr>",
                desc = "Help Tag",
            },
        },
    }
