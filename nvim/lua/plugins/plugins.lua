return {
  -- Load Rose Pine colorscheme
  { "rose-pine/neovim" },
  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
  {
    -- change some telescope options and a keymap to browse plugin files
    {
      "nvim-telescope/telescope.nvim",
      keys = {
        -- Update <leader>ff to search only in the current working directory
        {
          "<leader>ff",
          function()
            require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
          end,
          desc = "Find Files in Current Directory",
        },
      },
      -- change some options
      opts = {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      },
    },
  },
  -- Temporary solution until the next Lazyvim release
  -- https://github.com/LazyVim/LazyVim/issues/5899#issuecomment-2781398031
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },
}
