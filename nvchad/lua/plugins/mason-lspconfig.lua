local opts = {
  ensure_installed = {
    "css-lsp",
    "html-lsp",
    "lua-language-server",
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
