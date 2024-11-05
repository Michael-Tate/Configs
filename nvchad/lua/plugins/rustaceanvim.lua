return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	["rust-analyzer"] = {
		cargo = {
			allFeatures = true,
		},
	},
	lazy = false, -- already lazy
}
