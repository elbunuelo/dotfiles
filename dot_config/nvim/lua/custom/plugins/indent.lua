-- Enable persistent indentation when using > and <
-- Instead of allowing for just one indentation per key press
-- now it can be done multiple times.
vim.keymap.set({ 'n', 'v' }, '<', '<gv')
vim.keymap.set({ 'n', 'v' }, '>', '>gv')

return {}
