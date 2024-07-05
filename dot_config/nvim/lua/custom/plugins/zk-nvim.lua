-- See .config/nvim/after/syntax/markdown.vim for link conceal config
-- See .config/nvim/ftplugin/markdown.lua for zk specific bindings.

local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zT", "<Cmd>ZkTags<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkNew { group = 'daily', edit = true }<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>zw", "<Cmd>ZkNew { group = 'weekly', edit = true }<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkInsertLink<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf",
  "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    vim.cmd("set conceallevel=2")
  end,
  pattern = '*.md'
})

return {
  "mickael-menu/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",
      auto_attach = {
        enabled = true,
        filetypes = { "markdown" },
      },
    })
  end
}
