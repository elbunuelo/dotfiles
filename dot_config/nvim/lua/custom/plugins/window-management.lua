-- Allow switching  and creating windows using ctrl + h|j|k|l
vim.keymap.set({ 'n' }, '<C-h>', function() winmove("h") end, { silent = true })
vim.keymap.set({ 'n' }, '<C-j>', function() winmove("j") end, { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', function() winmove("k") end, { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', function() winmove("l") end, { silent = true })

-- Close the current window using ctrl + w
vim.keymap.set({ 'n' }, '<C-x>', ':q<CR>', { silent = true })

winmove = function(key)
  local curwin = vim.api.nvim_get_current_win()
  local result
  vim.api.nvim_exec('wincmd ' .. key, result)
  if curwin == vim.api.nvim_get_current_win() then
    if string.match(key, '[jk]') then
      vim.api.nvim_exec('wincmd s', result)
    else
      vim.api.nvim_exec('wincmd v', result)
    end
    vim.api.nvim_exec('wincmd ' .. key, result)
  end
end

return {}
