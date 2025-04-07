return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_go = require("dap-go")

    -- Configure UI
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "←",
          run_last = "↻",
          terminate = "□",
        },
      },
    })

    -- Configure dap-go
    dap_go.setup({
      -- dap-go options
      dap_configurations = {
        {
          type = "go",
          name = "Debug File",
          request = "launch",
          program = "${file}"
        },
        {
          type = "go",
          name = "Debug Test",
          request = "launch",
          mode = "test",
          program = "${file}"
        },
        {
          type = "go",
          name = "Debug Test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        }
      },
      delve = {
        initialize_timeout_sec = 20,
        port = "${port}"
      },
    })

    -- Enable virtual text
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      all_frames = true,
      virt_text_pos = 'eol',
      all_references = true,
    })

    -- UI integration
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Set up signs
    vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint', linehl='', numhl='' })
    vim.fn.sign_define('DapBreakpointCondition', { text='◆', texthl='DapBreakpointCondition', linehl='', numhl='' })
    vim.fn.sign_define('DapLogPoint', { text='◆', texthl='DapLogPoint', linehl='', numhl='' })
    vim.fn.sign_define('DapStopped', { text='→', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped' })
    vim.fn.sign_define('DapBreakpointRejected', { text='●', texthl='DapBreakpointRejected', linehl='', numhl='' })
  end
}
