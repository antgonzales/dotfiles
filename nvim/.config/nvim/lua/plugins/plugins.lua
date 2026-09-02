return {
  -- Rose Pine, kept installed so `:colorscheme rose-pine-moon` still works
  -- for comparison while Replica is on trial. Colorscheme selection moved
  -- to the LazyVim block below.
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      disable_background = true,
      disable_float_background = true,
    },
  },
  -- LazyVim configuration
  {
    "LazyVim/LazyVim",
    opts = {
      -- Replica ships in colors/ rather than as a plugin, so it only needs
      -- naming. Transparency keeps Ghostty's background-opacity and blur
      -- visible, the way Rose Pine was set up; drop it for an opaque
      -- background painted by the colorscheme itself.
      colorscheme = function()
        vim.g.replica_transparent = true
        vim.cmd.colorscheme(
          vim.o.background == "light" and "replica-bone" or "replica-carbon"
        )
      end,
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
      return {
        filetypes = {
          markdown = false,
          txt = false,
          yaml = false,
          gitcommit = false,
          gitrebase = false,
        },
      }
    end,
  },
}