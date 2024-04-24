return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  keys = {
    { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
  },
  config = function()
    require('dapui').setup()
  end
}
