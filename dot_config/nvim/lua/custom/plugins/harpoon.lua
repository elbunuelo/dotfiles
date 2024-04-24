return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to harpoon" })
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "List elements in harpoon" })

    vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end,
      { desc = "Select first element in harpoon list" })
    vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end,
      { desc = "Select second element in harpoon list" })
    vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end,
      { desc = "Select third element in harpoon list" })
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end,
      { desc = "Select fourth element in harpoon list" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
      { desc = "Select next element in harpoon list" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
      { desc = "Select previous element in harpoon list" })
  end
}
