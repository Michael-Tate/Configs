local colors = {
	darkgray = "#16161d",
	gray = "#727169",
	innerbg = nil,
	outerbg = "#16161D",
	normal = "#7e9cd8",
	insert = "#98bb6c",
	visual = "#ffa066",
	replace = "#e46876",
	command = "#e6c384",
}

local transparent_theme = {
	inactive = {
		a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
	visual = {
		a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
	replace = {
		a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
	normal = {
		a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
	insert = {
		a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
	command = {
		a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
		b = { fg = colors.gray, bg = colors.outerbg },
		c = { fg = colors.gray, bg = colors.innerbg },
	},
}

local config = function()
	require("lualine").setup({
		options = {
			theme = transparent_theme,
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_x = { "branch", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
