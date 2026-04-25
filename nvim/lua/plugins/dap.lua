return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
    },

    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      -- dap-ui
      ui.setup()

      -- Go debugger
      require("dap-go").setup()

      -- Inline virtual text (dimmed debugger values)
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,

        highlight_changed_variables = true,
        highlight_new_as_changed = false,

        show_stop_reason = true,

        commented = true, -- dimmed like comments
        virt_text_pos = "eol", -- show at end of line
        all_references = false,
        clear_on_continue = false,

        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)

          -- hide secrets
          if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
            return " ***** "
          end

          -- trim long values
          if #variable.value > 20 then
            return " " .. string.sub(variable.value, 1, 20) .. "... "
          end

          return " " .. variable.value
        end,
      })

      -- Hover debugger value with K
      vim.keymap.set("n", "K", function()
        require("dap.ui.widgets").hover()
      end, { desc = "DAP Hover Value" })

      -- Delve adapter for Go
      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug package",
          request = "launch",
          program = "${fileDirname}",
        },
        {
          type = "go",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug test (package)",
          request = "launch",
          mode = "test",
          program = "${fileDirname}",
        },
        {
          type = "go",
          name = "Attach",
          request = "attach",
          mode = "local",
          processId = require("dap.utils").pick_process,
        },
      }

      -- Keymaps
      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)

      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      vim.keymap.set("n", "<space>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end)

      vim.keymap.set("n", "<space>?", ui.eval)
      vim.keymap.set("v", "<space>?", ui.eval)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

      -- Telescope breakpoints
      vim.keymap.set("n", "<space>bl", function()
        require("telescope").extensions.dap.list_breakpoints({})
      end)

      -- dap-ui controls
      vim.keymap.set("n", "<space>du", ui.toggle)

      vim.keymap.set("n", "<space>ds", function()
        ui.float_element("scopes")
      end)

      vim.keymap.set("n", "<space>dr", function()
        ui.float_element("repl")
      end)

      vim.keymap.set("n", "<space>dw", function()
        ui.float_element("watches")
      end)

      -- Auto open/close UI
      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
