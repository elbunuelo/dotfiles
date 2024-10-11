return {
  'ruifm/gitlinker.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require("gitlinker").setup()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>gb",
      '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr><cr>',
      { silent = true, desc = "Open git link for current line in browser" }
    )

    vim.api.nvim_set_keymap(
      "v",
      "<leader>gb",
      '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr><cr>',
      { desc = "Open git link for selected lines in browser" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>gy",
      '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
      { desc = "Copy git link for current line" }
    )

    vim.api.nvim_set_keymap(
      "v",
      "<leader>gy",
      '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
      { desc = "Copy git link for selected lines" }
    )
  end
}
