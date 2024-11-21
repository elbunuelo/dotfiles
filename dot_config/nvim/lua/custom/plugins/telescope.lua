-- Additional keymaps for telescope, Ctrl + p and \ for searching files and grepping, respectively
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '\\', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[S]earch by [G]rep' })
return {
}
