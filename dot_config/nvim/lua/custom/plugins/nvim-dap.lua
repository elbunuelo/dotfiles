-- The color scheme clears user defined colors, so this is necessary to override it
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "prevent colorscheme clears self-defined DAP icon colors.",
  callback = function()
    -- Reuse current SignColumn background (except for DapStoppedLine)
    local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
    -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
    -- convert to 6 digit hex value starting with #
    local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
    local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

    vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#c23127', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapBreakpointRejected',
      { fg = '#888ca6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
  end
})

vim.fn.sign_define('DapBreakpoint', {
  text = '⟿',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl =
  'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
  { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "js-debug-adapter")
      end,
    },
  },
  keys = {
    {
      "<leader>dB",
      function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      desc =
      "Breakpoint Condition"
    },
    {
      "<leader>db",
      function() require("dap").toggle_breakpoint() end,
      desc =
      "Toggle Breakpoint"
    },
    {
      "<leader>dc",
      function() require("dap").continue() end,
      desc =
      "Continue"
    },
    {
      "<leader>da",
      function() require("dap").continue({ before = get_args }) end,
      desc =
      "Run with Args"
    },
    {
      "<leader>dC",
      function() require("dap").run_to_cursor() end,
      desc =
      "Run to Cursor"
    },
    {
      "<leader>dg",
      function() require("dap").goto_() end,
      desc =
      "Go to Line (No Execute)"
    },
    {
      "<leader>di",
      function() require("dap").step_into() end,
      desc =
      "Step Into"
    },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end,   desc = "Up" },
    {
      "<leader>dl",
      function() require("dap").run_last() end,
      desc =
      "Run Last"
    },
    {
      "<leader>do",
      function() require("dap").step_out() end,
      desc =
      "Step Out"
    },
    {
      "<leader>dO",
      function() require("dap").step_over() end,
      desc =
      "Step Over"
    },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    {
      "<leader>dr",
      function() require("dap").repl.toggle() end,
      desc =
      "Toggle REPL"
    },
    {
      "<leader>ds",
      function() require("dap").session() end,
      desc =
      "Session"
    },
    {
      "<leader>dt",
      function() require("dap").terminate() end,
      desc =
      "Terminate"
    },
    {
      "<leader>dw",
      function() require("dap.ui.widgets").hover() end,
      desc =
      "Widgets"
    },
  },
  config = function()
    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })
    for _, language in ipairs({ "typescript", "javascript", "svelte", "vue" }) do
      require("dap").configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
          -- use nvim-dap-vscode-js's pwa-node debug adapter
          type = "pwa-node",
          -- attach to an already running node process with --inspect flag
          -- default port: 9222
          request = "attach",
          -- allows us to pick the process using a picker
          processId = require 'dap.utils'.pick_process,
          -- name of the debug action you have to select for this config
          name = "Attach debugger to existing `node --inspect` process",
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**" },
          -- path to src in vite based projects (and most other projects as well)
          cwd = "${workspaceFolder}/src",
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
          localRoot = vim.fn.getcwd(),
        },
        {
          type = "pwa-chrome",
          name = "Launch Chrome to debug client",
          request = "launch",
          url = "http://localhost:5173",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          cwd = "${workspaceFolder}",
        },
      }
    end

    require("dapui").setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.set_log_level('DEBUG')
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end
}
