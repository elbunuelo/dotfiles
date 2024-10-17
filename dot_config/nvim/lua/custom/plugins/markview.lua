vim.api.nvim_set_keymap("n", "<leader>Ct",
  "<Cmd>CheckboxToggle<CR>",
  { noremap = true, silent = false, desc = "Toggle Checkbox" })

vim.api.nvim_set_keymap("n", "<leader>CC",
  "<Cmd>CheckboxNext<CR>",
  { noremap = true, silent = false, desc = "Check/uncheck checkbox" })
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended

  config = function()
    require("markview").setup({
      checkboxes = {
        enable = true,

        checked = {
          --- Text to show
          ---@type string
          text = "✔",

          --- Highlight group for "text"
          ---@type string?
          hl = "MarkviewCheckboxChecked",

          --- Highlight group to add to the body
          --- of the list item.
          ---@type string?
          scope_hl = nil
        },

        unchecked = {
          text = "✘",
          hl = "MarkviewCheckboxUnchecked",
          scope_hl = nil
        },

        --- Custom checkboxes configuration
        custom = {
          {
            --- Text inside []
            ---@type string
            match_string = "-",

            ---@type string
            text = "◯",

            ---@type string?
            hl = "MarkviewCheckboxPending",

            ---@type string?
            scope_hl = nil
          },
          {
            match_string = "~",
            text = "󰜺",
            hl = "MarkviewCheckboxStriked",
            scope_hl = "MarkviewCheckboxStriked"
          },
        }
      },
      links = {
        enable = true,
        hyperlinks = {
          enable = true,
          __emoji_link_compatability = true,

          icon = "󰌷 ",
          hl = "MarkviewHyperlink",

          custom = {
            ---+ ${conf, Stack*}
            { match_string = "stackoverflow%.com", icon = " " },
            { match_string = "stackexchange%.com", icon = " " },
            ---_

            { match_string = "neovim%.org", icon = " " },

            { match_string = "dev%.to", icon = " " },
            { match_string = "github%.com", icon = " " },
            { match_string = "reddit%.com", icon = " " },
            { match_string = "freecodecamp%.org", icon = " " },
            { match_string = "%.aha.io", icon = "󱈸" },

            { match_string = "https://(.+)$", icon = "󰞉 " },
            { match_string = "http://(.+)$", icon = "󰕑 " },
            { match_string = "[%.]md$", icon = " " }
          }
        },
      }
    })

    local checkboxes = require("markview.extras.checkboxes")
    checkboxes.configuraton = {
      --- When true, list item markers will
      --- be removed.
      remove_markers = true,

      default_marker = "-",
      default_state = " ",

      --- A list of states
      states = {
        { " ", "X" },
        { "-", "o", "~" }
      },
    }
    checkboxes.setup();
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  }
}
