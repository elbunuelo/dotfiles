return {
  'tpope/vim-fugitive',
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>gs", '<cmd>:Git<cr>', { silent = true, desc = "Open git status" })
    vim.api.nvim_set_keymap("n", "<leader>gw", '<cmd>:Gwrite<cr>', { silent = true, desc = "Stage current file" })
    vim.api.nvim_set_keymap("n", "<leader>gc", '<cmd>:Git commit<cr>', { silent = true, desc = "Stage current file" })
    vim.api.nvim_set_keymap("n", "<leader>gb", '<cmd>:Git blame<cr>',
      { silent = true, desc = "Open blame for current file" })
    vim.api.nvim_set_keymap("n", "<leader>gd", '<cmd>:Git diff<cr>', { silent = true, desc = "Diff current file" })
  end
}
