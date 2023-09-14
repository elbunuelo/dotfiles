-- Enable highlight search by default and disable it with Ctrl + n
vim.opt.hlsearch = true
vim.keymap.set('n', '<C-n>', function () vim.cmd(':nohlsearch') end)
return {
}
