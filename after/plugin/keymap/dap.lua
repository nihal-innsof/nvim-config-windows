local status, whichkey = pcall(require, "which-key")

local keymap = {
  b = {
    name = "Breakpoints",
    c = {
      function()
        require('dap').clear_breakpoints()
      end,
      "Clear all Breakpoints"
    }
  },
  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },
  u = {
    i = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" }
  }
}

whichkey.register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})

local keymap_v = {
  name = "Debug",
  e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
}

whichkey.register(keymap_v, {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
