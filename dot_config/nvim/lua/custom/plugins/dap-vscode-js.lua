return {
  'mxsdev/nvim-dap-vscode-js',
  dependencies = {
    'mfussenegger/nvim-dap',
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
    }
  },
}
