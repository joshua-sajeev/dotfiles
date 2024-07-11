require('config.options')
require('config.keymaps')
require('config.lazy')
-- Autocommand to format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = true })
  end
})
