require('github-theme').setup({
  options = {
    hide_nc_statusline = false,
    inverse = {
      match_paren = true,
      visual = true,
      search = true,
    },
    darken = {
      sidebars = {
        enabled = false,
      },
    },
    styles = {
      comments = 'italic',
      keywords = 'bold',
    }
  },
})

-- Set colorscheme after options
vim.cmd('colorscheme github_dark_dimmed')
