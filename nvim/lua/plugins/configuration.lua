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
  -- Fix issue with hnvm and the lsp server when moving between contexts
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        vtsls = function(_, opts)
          -- Inject the HNVM_NODE variable so vtsls picks the right Node version.
          opts.cmd_env = {
            HVNM_QUIET = false, -- Ensure we log hnvm info in cases of failure.
            HNVM_NODE = "20.16.0", -- Update this version to match your hnvm setup.
          }
        end,
      },
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
}
