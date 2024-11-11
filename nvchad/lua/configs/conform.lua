local options = {
  formatters_by_ft = {
    cpp = { "clang-format" },
    lua = { "stylua" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    rust = { "rustfmt" }
  },

  formatters = {
    [ "clang-format" ] = {
      prepend_args = {
        "--style=file:/home/mtate/.clang-format"
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
