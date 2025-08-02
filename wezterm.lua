-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- default startup
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,

	-- window
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	-- default_prog = { "wsl.exe", "bash", "-c", "source ~/.bashrc; nvim" },

	-- cell
	cell_width = 0.9,

	-- font
	font_size = 18.0,

	-- cursor
	colors = {
		cursor_bg = "#bfbfbf",
	},

	background = {
		{
			source = {
				File = "/Users/User/Pictures/wezterm-wallpaper.jpg", -- interstellar planet
				-- File = "/Users/leeweixuan/Pictures/wezterm-wallpaper.gif", -- ocean with evening sun (light)
				-- File = "/Users/leeweixuan/Pictures/wezterm-wallpaper-1.gif", -- ocean with evening sun (dimmer)
			},
			hsb = {
				hue = 1.0,
				saturation = 1.0,
				brightness = 0.1,
			},
			width = "100%",
			height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.1,
		},
	},
	window_padding = {
		left = 10,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

-- keybinds
local act = wezterm.action
config.keys = {
	{
		key = "v",
		mods = "ALT|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "ALT|SHIFT",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "m",
		mods = "ALT|SHIFT",
		action = act.TogglePaneZoomState,
	},
	{
		key = "s",
		mods = "ALT|SHIFT",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	-- switch between active panes
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "n",
		mods = "CTRL",
		action = act.SpawnWindow,
	},
}

return config
