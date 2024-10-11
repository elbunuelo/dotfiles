return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function(_, opts)
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })

    opts.icons_enabled = true;
    opts.theme = 'onedark';
    opts.component_separators = { left = '', right = '' }
    opts.section_separators = { left = '', right = '' }
    opts.sections = {
      lualine_x = { require("capslock").status_string },
      lualine_c = {
        {
          symbols.get,
          cond = symbols.has
        }
      }
    }
  end
}
