local colorscheme = "catppuccin"
-- local catppuccin_flavour = "frappe"
-- local colorscheme = "nightfox"
-- local colorscheme = "terafox"
--
-- local status_ok, theme = pcall(require, colorscheme)
-- if not status_ok then
-- 	return
-- end

if os.getenv("PWD") == "/Users/dennisjosephgray/zettelkasten" then
  colorscheme = "nightfox"
end

require("catppuccin").setup({
	transparent_background = false,
	no_italic = true,
	flavour = catppuccin_flavour,
})

-- NIGHT FOX https://github.com/EdenEast/nightfox.nvim
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {
		carbonfox = {},
	},
	specs = {
		carbonfox = {
			syntax = {},
		},
	},
	groups = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
