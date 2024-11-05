return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- comment to get rid of format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
