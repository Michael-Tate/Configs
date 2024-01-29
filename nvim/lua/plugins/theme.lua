return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("tokyonight").setup({
			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			transparent = true, -- Enable this to disable setting the background color
		})

		vim.cmd("colorscheme tokyonight-moon")
	end,
}
