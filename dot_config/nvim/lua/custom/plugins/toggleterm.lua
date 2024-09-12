function setup_lazygit()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })

  vim.keymap.set("n", "<leader>gl", function() lazygit:toggle() end,
    { noremap = true, silent = true, desc = "Open lazygit" })
end

function setup_aha()
  local Terminal = require('toggleterm.terminal').Terminal
  local aha_factory = function(command)
    return Terminal:new({
      cmd = "~/Projects/aha/aha-dev-cli/aha " .. command,
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
        width = 110,
        height = 35,
      },
      close_on_exit = false,
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>startinsert<CR><C-c>",
          { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd("startinsert!")
      end,

    })
  end

  vim.keymap.set("n", "<leader>!!", function() aha_factory(''):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! CLI' })
  vim.keymap.set("n", "<leader>!p", function() aha_factory('pull_request'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Pull request' })
  vim.keymap.set("n", "<leader>!c", function() aha_factory('create'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Create' })
  vim.keymap.set("n", "<leader>!b", function() aha_factory('bug_fix'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Bug Fix' })
  vim.keymap.set("n", "<leader>!z", function() aha_factory('support_fix'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Zendesk Support Fix' })
  vim.keymap.set("n", "<leader>!s", function() aha_factory('start'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Start' })
  vim.keymap.set("n", "<leader>!m", function() aha_factory('slack'):toggle() end,
    { noremap = true, silent = true, desc = 'Aha! Slack Message' })
end

return {
  'akinsho/toggleterm.nvim',
  init = function()
    local module = require('toggleterm.terminal')
    local function open_in_tab()
      local id = module.identify()
      local term = module.get(id)
      if not term then
        print('Terminal not found')
        return
      end

      term.close(term)
      local new_direction = 'tab'
      local size = nil
      if term.direction == 'tab' then
        new_direction = 'horizontal'
        size = 20
      end
      term.open(term, size, new_direction)
    end

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', '<C-><esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set('t', '<C-Z>', open_in_tab, opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    setup_aha()
    setup_lazygit()
  end,
  opts = {
    open_mapping = [[<c-\>]]
  }
}
