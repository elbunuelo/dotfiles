-- Reference: https://jdhao.github.io/2021/09/09/nvim_use_virtual_text/
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buffer_number = vim.fn.bufnr('%')
    local namespace = vim.api.nvim_create_namespace('buffer_title')
    local row = 0
    local column = 0

    local options = {
      id = 1,
      virt_text = { { vim.fn.expand('%:t'), "@comment" } },
      virt_text_pos = 'right_align'
    }

    vim.api.nvim_buf_set_extmark(buffer_number, namespace, row, column, options)
  end
})

return {}
