local opts = {
  ensure_installed = {
    "cssls",
    "html",
    "lua_ls",
    "rust_analyzer",
    "clangd",
  },

  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
