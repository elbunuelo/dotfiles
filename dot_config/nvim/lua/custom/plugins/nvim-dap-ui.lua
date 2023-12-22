return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  opts = {
    library = { plugins = { "nvim-dap-ui" }, types = true },
  }
}
