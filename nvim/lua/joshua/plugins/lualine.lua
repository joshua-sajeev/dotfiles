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
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'buffers'},
            lualine_x = {'ctime'},
            lualine_y = {'progress'},
            lualine_z = {'cdate'},
        },
        })
    end
}

