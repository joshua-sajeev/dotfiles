return{
        "danymat/neogen", 
         dependencies = {
             "nvim-treesitter/nvim-treesitter",
         },
        config = function ()
            require("neogen").setup({
            })
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<Leader>df",":lua require('neogen').generate({type = 'func')<CR>", opts)
        end,
}
