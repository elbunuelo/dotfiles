vim.api.nvim_set_keymap("n", "<leader>la", "<Cmd>Ask<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("x", "<leader>la", "<Esc><Cmd>'<, '>Ask <CR>", { noremap = true, silent = false })

return {
  "git@github.com:aha-app/llm-sidekick.nvim.git",
  dependencies = { "nvim-lua/plenary.nvim" },
}
