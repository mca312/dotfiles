return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function ()
    local dap = require "dap"
    local ui = require "dapui"

    require("dapui").setup()
    require("dap-go").setup()

    -- require("nvim-dap-virtual-text").setup()

    dap.listeners.before.attach.dapui_config = function ()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function ()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function ()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function ()
      ui.open()
    end
  end
}
