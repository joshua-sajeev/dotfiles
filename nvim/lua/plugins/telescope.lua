return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- local actions = require('telescope.actions')  -- Load telescope.actions correctly
        require('telescope').setup{
            --     defaults = {
            --         mappings = {
            --             i = {
            --                 ["<C-u>"] = actions.preview_scrolling_up,    -- Use actions from telescope.actions
            --                 ["<C-d>"] = actions.preview_scrolling_down,
            --                 ["<C-f>"] = actions.preview_scrolling_left,
            --                 ["<C-k>"] = actions.preview_scrolling_right,
            --             },
            --             n = {
            --                 ["<C-u>"] = actions.preview_scrolling_up,
            --                 ["<C-d>"] = actions.preview_scrolling_down,
            --                 ["<C-f>"] = actions.preview_scrolling_left,
            --                 ["<C-k>"] = actions.preview_scrolling_right,
            --             },
            --         },
            --     },
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
