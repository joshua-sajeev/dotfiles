-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("n", "<leader>pv", "<cmd>:Ex<CR>")
keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous Quickfix item" })
keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next Quickfix item" })
-- Undo tree
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "UndotreeToggle" })
keymap.set("n", "<leader><Tab>d", "<cmd>bdelete<CR>", { desc = "Close the buffer" })
keymap.set("n", "<leader>gtf", "<cmd>GoTestFunc<CR>", { desc = "Test go func" })
keymap.set("n", "<leader>tt", function()
  vim.cmd("cgetexpr system('go test -count=1 ./... 2>&1')")
  vim.cmd("copen")
end, { desc = "Run Go tests and open quickfix" })
-- local dap = require("dap")
-- local dapui = require("dapui")
--
-- -- Toggle breakpoint
-- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
--
-- -- Start / Continue debugging
-- vim.keymap.set("n", "<leader>dc", dap.continue)
--
-- -- Step over
-- vim.keymap.set("n", "<leader>do", dap.step_over)
--
-- -- Step into
-- vim.keymap.set("n", "<leader>di", dap.step_into)
--
-- -- Step out
-- vim.keymap.set("n", "<leader>dO", dap.step_out)
--
-- -- Open UI
-- vim.keymap.set("n", "<leader>du", dapui.toggle)
--
-- -- Terminate
-- vim.keymap.set("n", "<leader>dt", dap.terminate)
