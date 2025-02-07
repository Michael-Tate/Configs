local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    rust = { "rustfmt" },
  },

  formatters = {
    ["clang-format"] = {
      prepend_args = {
        "--style=file:/home/tate/.clang-format",
      },
    },
    rustfmt = {
      options = {
        default_edition = "2021",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
