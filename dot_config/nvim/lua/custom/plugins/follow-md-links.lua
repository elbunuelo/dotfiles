-- Plugin to open links in markdown files by pressing enter
-- https://github.com/jghauser/follow-md-links.nvim

-- For some
vim.keymap.set('n', '<leader><cr>', '<Cmd>lua require("follow-md-links").follow_link()<cr>',
  { silent = true, noremap = true, desc = 'Open link under cursor' })

return {
  'jghauser/follow-md-links.nvim'
}
