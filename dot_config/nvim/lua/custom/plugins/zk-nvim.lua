-- See .config/nvim/after/syntax/markdown.vim for link conceal config
-- See .config/nvim/ftplugin/markdown.lua for zk specific bindings.

vim.api.nvim_set_keymap("n", "<leader>zf",
  "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
  { noremap = true, silent = false, desc = "Find notes" })
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>",
  { noremap = true, silent = false, desc = "Find notes matching selection" })

vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
  { noremap = true, silent = false, desc = "Create new note" })

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
  { noremap = true, silent = false, desc = "Open note" })
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zT", "<Cmd>ZkTags<CR>",
  { noremap = true, silent = false, desc = "Open note associated with selected tags" })

vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkNew { group = 'daily', edit = true }<CR>",
  { noremap = true, silent = false, desc = "Open today's log" })

vim.api.nvim_set_keymap("n", "<leader>zw", "<Cmd>ZkNew { group = 'weekly', edit = true }<CR>",
  { noremap = true, silent = false, desc = "Open this week's log" })

vim.api.nvim_set_keymap("n", "<leader>zL", "<Cmd>ZkInsertLink<CR>",
  { noremap = true, silent = false, desc = "Insert link" })

vim.api.nvim_set_keymap("v", "<leader>zL", ":'<,'>ZkInsertLinkAtSelection<CR>",
  { noremap = true, silent = false, desc = "Insert link at selection" })

-- Create a new note in the same directory as the current buffer, using the current selection for title.
vim.api.nvim_set_keymap("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
  { noremap = true, silent = false, desc = "Create new note with selected title" })

-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
vim.api.nvim_set_keymap("v", "<leader>znc",
  ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
  { noremap = true, silent = false, desc = "Create new note with selected content" })

-- Open notes linking to the current buffer.
vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>",
  { noremap = true, silent = false, desc = "Show notes linking current note" })

-- Preview a linked note.
vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = false, desc = "Preview linked note" })

-- Open the code actions for a visual selection.
vim.api.nvim_set_keymap("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>",
  { noremap = true, silent = false, desc = "Open code actions for selection" })

vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    vim.cmd("set conceallevel=2")
  end,
  pattern = '*.md'
})

return {
  "zk-org/zk-nvim",
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
