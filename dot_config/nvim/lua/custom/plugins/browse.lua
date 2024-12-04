vim.keymap.set("n", "<leader>Bb", function()
  require("browse").browse()
end)

vim.keymap.set("n", "<leader>BD", function() require('browse.devdocs').search_with_filetype() end,
  { noremap = true, silent = true, desc = "Search DevDocs with filetype" })

vim.keymap.set("n", "<leader>Bd", function() require('browse.devdocs').search() end,
  { noremap = true, silent = true, desc = "Search DevDocs" })

vim.keymap.set("n", "<leader>Bm", function() require('browse.mdn').search() end,
  { noremap = true, silent = true, desc = "Search MDN" })

return {
  "lalitmee/browse.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    provider = "duckduckgo", -- duckduckgo, bing

    -- either pass it here or just pass the table to the functions
    -- see below for more
    bookmarks = {
      ["github"] = {
        ["name"] = "search github from neovim",
        ["code_search"] = "https://github.com/search?q=repo:aha-app/aha-app %s&type=code",
        ["pulls_search"] = "https://github.com/aha-app/aha-app/pulls?q=is:open+is:pr+%s",
        ["my_prs_search"] = "https://github.com/aha-app/aha-app/pulls?q=is:open+is:pr+author:elbunuelo %s"
      },
    },
    icons = {
      bookmark_alias = "",
      bookmarks_prompt = "󰂺 ",
      grouped_bookmarks = "",
    }
  }
}
