return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Defer UI setup to avoid Neovim E565 in restricted contexts.
      vim.schedule(function()
        dapui.setup()
      end)

      require("dap-go").setup()

      -- Automatically open/close the UI during debugging.
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set("n", "<Leader>dt", function()
        dapui.toggle()
      end, { desc = "Toggle DAP UI" })

      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {
        desc = "Toggle breakpoint",
      })

      vim.keymap.set("n", "<Leader>dc", dap.continue, {
        desc = "Debug continue",
      })

      vim.keymap.set("n", "<Leader>dr", function()
        dapui.open({ reset = true })
      end, { desc = "Reset and open DAP UI" })

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "DapBreakpoint",
      })
    end,
  },
}
