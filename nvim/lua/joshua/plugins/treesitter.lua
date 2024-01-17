return{
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
           require("nvim-treesitter").setup({
               ensure_installed = {
                   "c", "lua", "vim", "vimdoc", "rust","python",
               },
               auto_install = true,
               sync_install = false,
               indent = {
                   enable = true
               },
               highlight = {
                   enable = true,
               },
           })

        end
    },
}
