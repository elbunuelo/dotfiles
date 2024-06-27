--  configuration for Octo.nvim https://github.com/pwntester/octo.nvim
-- The plugin interacts with the github gh cli from nvim.

-- Will use the o prefix to interact with the plugin via keymaps
vim.api.nvim_set_keymap('n', '<leader>op', '<cmd>:Octo pr search review-requested:elbunuelo state:open<cr>',
  { desc = 'Search PRs awaiting review from me.' })
vim.api.nvim_set_keymap('n', '<leader>os', '<cmd>:Octo pr search<cr>',
  { desc = 'Search all PRs' })

vim.api.nvim_set_keymap('n', '<leader>oc', '<cmd>:Octo pr checkout<cr>',
  { desc = 'Check out currently selected PR.' })

-- ORI is from Octo review init.
vim.api.nvim_set_keymap('n', '<leader>ori', '<cmd>:Octo pr review<cr>',
  { desc = 'Start a review on the currently selected PR.' })

vim.api.nvim_set_keymap('n', '<leader>orr', '<cmd>:Octo pr review<cr>',
  { desc = 'Resume a review on the currently selected PR.' })

vim.api.nvim_set_keymap('n', '<leader>orc', '<cmd>:Octo review comments<cr>',
  { desc = 'Reveiw pending comments in current review.' })

vim.api.nvim_set_keymap('n', '<leader>ors', '<cmd>:Octo review submit<cr>',
  { desc = 'Submit current review.' })

-- <space>ca adds a comment
-- <space>sa adds a suggestion

return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require "octo".setup(
      {
        suppress_missing_scope = {
          projects_v2 = true,
        }
      }
    )
  end

}
