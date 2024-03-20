-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration
local config = wezterm.config_builder()

config.window_frame = {
	font_size = 10,
}

config.initial_cols = 160
config.initial_rows = 80
-- This is where config choices are made
config.keys = {
	-- This will create a new split and run the `top` program inside it
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Left",
			size = { Percent = 50 },
		}),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Up",
			size = { Percent = 50 },
		}),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL|CMD",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|CMD",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|CMD",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|CMD",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
}

config.colors = {
	foreground = "ffffff",
	background = "black",
	cursor_bg = "#c2ff00",
	cursor_border = "#c2ff00",
	split = "#ff6699",
	ansi = {
		"#000000",
		"#ff4c41",
		"#00ff3c",
		"#deff4c",
		"47a3ca",
		"#fa8d90",
		"#5ac8a9",
		"#fffeff",
	},
	brights = {
		"#a39f9f",
		"#fb4c45",
		"#c3e63f",
		"#ffd15b",
		"#82dfff",
		"#ffa6aa",
		"#8df1d4",
		"#fffeff",
	},
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

config.font_dirs = { "$HOME/.local/share/fonts/NerdFonts/", "$HOME/Library/Fonts" }
-- config.font = wezterm.font({
-- 	family = "Fira Code Nerd Font",
-- 	weight = "Medium",
-- })
config.font = wezterm.font_with_fallback({
	{ family = "Fira Code Nerd Font", weight = "Medium" },
	{ family = "FiraCode Nerd Font", weight = "Medium", scale = 1.3 },
})
config.font_size = 9
config.underline_position = "-2px"

-- For copy and pasting with right click
-- config.mouse_bindings = {
-- 	{
-- 		event = { Down = { streak = 1, button = "Right" } },
-- 		mods = "NONE",
-- 		action = act_callback(function(window, pane)
-- 			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
-- 			if has_selection then
-- 				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
-- 				window:perform_action(act.ClearSelection, pane)
-- 			else
-- 				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
-- 			end
-- 		end),
-- 	},
-- }

return config
