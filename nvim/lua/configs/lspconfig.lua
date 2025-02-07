-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
    "ruff",
    "pyright",
    "clangd",
    "dockerfilels",
    "bashls",
    "lua_ls",
}

--python
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pyright = {
      disableOrganizeImports = false,
      analysis = {
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        autoImportCompletions = true,
      },
    },
  },
})

-- lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- bash
lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "sh", "aliasrc" },
})

-- docker
lspconfig.dockerls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- C/C++
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})
