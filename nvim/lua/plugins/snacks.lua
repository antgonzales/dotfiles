-- Configure Snacks.nvim to display hidden files
-- This extends LazyVim's default Snacks configuration
return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- Enable hidden files by default
      hidden = true,
    },
  },
}