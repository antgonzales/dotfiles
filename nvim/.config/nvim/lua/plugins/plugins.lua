return {
  -- Rose Pine colorscheme with transparency support
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      disable_background = true,
      disable_float_background = true,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      
      -- Automatically detect theme from terminal background
      if vim.o.background == "dark" then
        vim.cmd("colorscheme rose-pine-moon")
      else
        vim.cmd("colorscheme rose-pine-dawn")
      end
    end,
  },
  -- LazyVim configuration
  {
    "LazyVim/LazyVim",
    opts = {
      -- Let Rose Pine handle colorscheme selection
    },
  },
  -- Telescope configuration
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