FloatLineNote = function(readOnly)
  -- Define the size of the floating window
  local width = 50
  local height = 10

  -- Create the scratch buffer displayed in the floating window
  local path = require("plenary.path")
  local utils = require('quicknote.utils')
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local column = cursor[2]

  local noteDirPath = utils.path.getNoteDirPathForCurrentBuffer()
  -- get note file path
  local noteFilePath = path:new(noteDirPath, line .. "." .. utils.config.GetFileType()).filename

  local buf = vim.api.nvim_create_buf(false, true)

  -- Get the current UI
  local ui = vim.api.nvim_list_uis()[1]

  -- Create the floating window
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = column,
    row = line,
    anchor = 'NW',
    style = 'minimal',
    border = 'rounded'
  }


  vim.loop.fs_stat(noteFilePath, function(err, _)
    if err then
      print("Note not found.")
    else
      -- open note file
      -- use vim.defer_fn to avoid "can not call nvim exec in vim loop event"
      vim.defer_fn(function()
        vim.api.nvim_open_win(buf, true, opts)
        vim.cmd(':read ' .. noteFilePath)
        if (readOnly) then
          vim.api.nvim_buf_set_option(buf, "modifiable", false)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>:close<cr>', {})
          vim.api.nvim_buf_set_keymap(buf, 'n', '<cr>', '<cmd>:close<cr>', {})
          vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>:close<cr>', {})
        end
      end, 0)
    end
  end)
end

vim.api.nvim_set_keymap('n', '<leader>Qnv', '<cmd>:lua FloatLineNote(true)<cr>', { desc = 'View line note' })
vim.api.nvim_set_keymap('n', '<leader>Qne', "<cmd>:lua require('quicknote').OpenNoteAtCurrentLine()<cr>",
  { desc = 'Edit line note' })

vim.api.nvim_set_keymap("n", "<leader>Qnl",
  "<cmd>:lua require('quicknote').NewNoteAtCurrentLine()<cr>",
  { desc = 'New note at current line' })

vim.api.nvim_set_keymap("n", "<leader>Qnd", "<cmd>:lua require('quicknote').NewNoteAtCWD()<cr>",
  { desc = 'New directory note' })

vim.api.nvim_set_keymap("n", "<leader>Qng", "<cmd>:lua require('quicknote').NewNoteAtGlobal()<cr>",
  { desc = 'New global note' })

vim.api.nvim_set_keymap("n", "<leader>Ql", "<cmd>:Telescope quicknote scope=CurrentBuffer<cr>",
  { desc = 'List current file notes' })

vim.api.nvim_set_keymap("n", "<leader>Qlg", "<cmd>:Telescope quicknote scope=Global<cr>",
  { desc = 'List global notes' })

vim.api.nvim_set_keymap("n", "<leader>Qld", "<cmd>:Telescope quicknote scope=CWD<cr>",
  { desc = 'List directory notes' })

vim.api.nvim_set_keymap("n", "<leader>Qdl", "<cmd>:lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
  { desc = 'Delete note at current line' })

vim.api.nvim_create_autocmd({ 'BufAdd', 'BufEnter', 'BufNew', 'BufWrite' }, {
  callback = function()
    local quicknote = require('quicknote')
    quicknote.HideNoteSigns()
    quicknote.ShowNoteSigns()
  end,
})


return {
  'RutaTang/quicknote.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  opts = {
    mode = "portable",
    sign = "",
    filetype = "md",
  }
}
