return{
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons' ,
        'archibate/lualine-time',
    },

    config = function()
        require("lualine").setup({
            sections = {
            lualine_a = {'mode'},
            lualine_c = {'buffers'},
            lualine_x = {'cdate'},
            lualine_y = {'progress'},
            lualine_z = {'ctime'},
        },
        })
    end
}

