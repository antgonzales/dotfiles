return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      vtsls = function(_, opts)
        -- Inject the HNVM_NODE variable so vtsls picks the right Node version.
        opts.cmd_env = {
          HVNM_QUIET = false, -- Ensure that we log hnvm information
          HNVM_NODE = "20.16.0", -- Update this version to match your hnvm setup.
        }

        -- Alternatively, override the cmd to use hnvm exec:
        -- opts.cmd = { "hnvm", "exec", "vtsls", "--stdio" }
      end,
    },
  },
}
