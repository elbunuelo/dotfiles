vim.g.cursorword_disable_at_startup = true

return {
  'elbunuelo/nvim-cursorword',
  config = function()
    vim.keymap.set('n', '<leader>h', function() vim.cmd('CursorWordToggle') end,
      { desc = 'Highlight word under cursor' })
    vim.api.nvim_set_hl(0, 'CursorWord', { reverse = true })
  end
}
