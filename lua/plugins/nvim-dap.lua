return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local virtual_text = require("nvim-dap-virtual-text")

   dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-dap',
      name = 'lldb'
    }

    local lldb = {
      name = "Launch lldb",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input(
          "Path to executable: ", vim.fn.getcwd() .. "/", "file"
        )
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    }

    dap.configurations.rust = {lldb}
    dap.configurations.c = {lldb}

    dapui.setup()
    virtual_text.setup()

    vim.api.nvim_create_user_command(
      "Debug",
      function()
        dapui.toggle()
      end,
      {}
    )
    vim.keymap.set('n', "<Leader>b", dap.toggle_breakpoint, {})
    vim.keymap.set('n', "<F2>", dap.continue, {})
    vim.keymap.set('n', "<F3>", dap.step_over, {})
    vim.keymap.set('n', "<F4>", dap.step_back, {})
    vim.keymap.set('n', "<F5>", dap.step_into, {})
    vim.keymap.set('n', "<F6>", dap.step_out, {})
    vim.keymap.set('n', "<Leader>n", dap.restart, {})
  end
}
