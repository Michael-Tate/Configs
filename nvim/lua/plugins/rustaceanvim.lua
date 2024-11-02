return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	["rust-analyzer"] = {
		cargo = {
			allFeatures = true,
		},
	},
	init = function()
		vim.g.rustaceanvim = function()
			-- Update this path
			local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"
			-- The liblldb extension is .so for Linux and .dylib for MacOS
			liblldb_path = liblldb_path .. ".so"

			local cfg = require("rustaceanvim.config")
			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end
	end,
	lazy = false, -- already lazy
}
