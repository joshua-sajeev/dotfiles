return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',  -- Add telescope-file-browser as a dependency
    },
    config = function()
        local actions = require('telescope.actions')  -- Load telescope.actions correctly

        require('telescope').setup{
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = actions.preview_scrolling_up,    -- Use actions from telescope.actions
                        ["<C-d>"] = actions.preview_scrolling_down,
                    },
                    n = {
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                    },
                },
            },
        }

        local builtin = require('telescope.builtin')

        -- Key mappings for Telescope functions
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', 'sf', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- Keymap for opening Telescope file browser
        vim.keymap.set('n', '<leader>sf', require('telescope').extensions.file_browser.file_browser, { desc = 'Telescope File Browser' })
    end
}
