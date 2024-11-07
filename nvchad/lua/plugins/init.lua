return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- comment to get rid of format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
