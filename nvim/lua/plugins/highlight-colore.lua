return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup({
        virtual_symbol = "●",
        render = "virtual",
      })
    end,
  },

  { "nvzone/volt", lazy = true },

  {
    "nvzone/minty",
    dependencies = { "nvzone/volt" },
    cmd = { "Shades", "Huefy" },
  },
}
