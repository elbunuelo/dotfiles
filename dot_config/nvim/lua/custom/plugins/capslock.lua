
return {
  'barklan/capslock.nvim',
  init = function()
    vim.keymap.set({ "i", "c", "n" }, "<C-g>c", "<Plug>CapsLockToggle")
    vim.keymap.set("i", "<C-l>", "<Plug>CapsLockToggle")
  end,
  opts = {}
}

