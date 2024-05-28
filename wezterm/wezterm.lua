local wezterm = require("wezterm")
local utils = require("utils")

---------------------------------------------------------------
--- keybinds
---------------------------------------------------------------
local tmux_keybinds = {
	{ key = "k", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "j", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
	{ key = "h", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "l", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "ALT|CTRL", action = wezterm.action({ MoveTabRelative = -1 }) },
	{ key = "l", mods = "ALT|CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "k", mods = "ALT|CTRL", action = "ActivateCopyMode" },
	{ key = "j", mods = "ALT|CTRL", action = wezterm.action({ PasteFrom = "PrimarySelection" }) },
	{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "-", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "=", mods = "ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "ALT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "ALT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "k", mods = "ALT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "j", mods = "ALT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "h", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
	{ key = "l", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
	{ key = "k", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
	{ key = "j", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
	{ key = " ", mods = "ALT", action = "QuickSelect" },
}

local default_keybinds = {
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "Insert", mods = "SHIFT", action = wezterm.action({ PasteFrom = "PrimarySelection" }) },
	{ key = "=", mods = "CTRL", action = "ResetFontSize" },
	{ key = "+", mods = "CTRL", action = "IncreaseFontSize" },
	{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
	{ key = " ", mods = "CTRL|SHIFT", action = "QuickSelect" },
	{ key = "x", mods = "CTRL|SHIFT", action = "ActivateCopyMode" },
	{ key = "PageUp", mods = "ALT", action = wezterm.action({ ScrollByPage = -1 }) },
	{ key = "PageDown", mods = "ALT", action = wezterm.action({ ScrollByPage = 1 }) },
	{ key = "r", mods = "ALT", action = "ReloadConfiguration" },
	{ key = "r", mods = "ALT|SHIFT", action = wezterm.action({ EmitEvent = "toggle-tmux-keybinds" }) },
	{ key = "e", mods = "ALT", action = wezterm.action({ EmitEvent = "trigger-nvim-with-scrollback" }) },
	{ key = "x", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
}

local function create_keybinds()
	return utils.merge_lists(default_keybinds, tmux_keybinds)
end

---------------------------------------------------------------
--- wezterm on
---------------------------------------------------------------
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
	if title == "" then
		local uri = utils.convert_home_dir(tab.active_pane.current_working_dir)
		local basename = utils.basename(uri)
		if basename == "" then
			basename = uri
		end
		title = wezterm.truncate_right(basename, max_width)
	end
	return {
		{ Text = tab.tab_index + 1 .. ":" .. title },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	local cwd_uri = pane:get_current_working_dir()
	local cwd = ""
	local hostname = ""
	if cwd_uri then
		cwd_uri = cwd_uri:sub(8)
		local slash = cwd_uri:find("/")
		if slash then
			hostname = cwd_uri:sub(1, slash - 1)
			-- Remove the domain name portion of the hostname
			local dot = hostname:find("[.]")
			if dot then
				hostname = hostname:sub(1, dot - 1)
			end
			if hostname ~= "" then
				hostname = "@" .. hostname
			end
			-- and extract the cwd from the uri
			cwd = utils.convert_home_dir(cwd)
		end
	end

	window:set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = cwd .. hostname },
	}))
end)

wezterm.on("toggle-tmux-keybinds", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.95
		overrides.keys = default_keybinds
	else
		overrides.window_background_opacity = nil
		overrides.keys = utils.merge_lists(default_keybinds, tmux_keybinds)
	end
	window:set_config_overrides(overrides)
end)

local io = require("io")
local os = require("os")

wezterm.on("trigger-nvim-with-scrollback", function(window, pane)
	local scrollback = pane:get_lines_as_text()
	local name = os.tmpname()
	local f = io.open(name, "w+")
	f:write(scrollback)
	f:flush()
	f:close()
	window:perform_action(
		wezterm.action({ SpawnCommandInNewTab = {
			args = { "nvim", name },
		} }),
		pane
	)
	wezterm.sleep_ms(1000)
	os.remove(name)
end)

function extract_filename(uri)
  local start, match_end = uri:find("$EDITOR:");
  if start == 1 then
    -- filepath /path/to/file.txt:row:column
    local filepath = uri:sub(match_end+1)
    local start, match_end = filepath:find(":");
    -- filename /path/to/file.txt
    local filename = filepath:sub(0, match_end - 1)

    -- row_col 10:5
    local row_col = filepath:sub(match_end + 1)
    local start, match_end = row_col:find(":");
    local row = row_col:sub(0, match_end - 1)
    local col = row_col:sub(match_end + 1)

    return filename, row, col
  end
  return nil
end

function debug(str)
  local text = "o" .. str
  return wezterm.action{SendString=text}
end

wezterm.on("open-uri", function(window, pane, uri)
  local name, row, col = extract_filename(uri)
  if name then
    local script_path = os.getenv("WEZTERM_CONFIG_DIR") .. "/scripts/edit_file"
    
    -- debugging
    -- local action = debug(script_path .. "/wezterm.lua")

    -- example: ~/.zshrc:10:5
    local action = wezterm.action{SpawnCommandInNewTab={
        args={"/bin/sh", script_path, name, row}
      }};

    window:perform_action(action, pane);

    -- prevent the default action from opening in a browser
    return false
  end
end)

---------------------------------------------------------------
--- load local_config
---------------------------------------------------------------
-- Write settings you don't want to make public, such as ssh_domains
local function load_local_config()
	local ok, _ = pcall(require, "local")
	if not ok then
		return {}
	end
	return require("local").setup()
end
local local_config = load_local_config()

-- local M = {}
-- local local_config = {
-- 	ssh_domains = {
-- 		{
-- 			-- This name identifies the domain
-- 			name = "my.server",
-- 			-- The address to connect to
-- 			remote_address = "192.168.8.31",
-- 			-- The username to use on the remote host
-- 			username = "katayama",
-- 		},
-- 	},
-- }
-- function M.setup()
-- 	return local_config
-- end
-- return M

---------------------------------------------------------------
--- Config
---------------------------------------------------------------
local config = {
	font = wezterm.font("Cica", {weight = "Bold"}),
  --font = wezterm.font("Iosevka Nerd Font", {weight = "Bold"}),
	use_ime = true,
	font_size = 14.0,
	-- color_scheme = "nordfox",
	-- color_scheme = "NightFox",
	color_scheme = "candy",
	color_scheme_dirs = { "$HOME/.config/wezterm/colors/" },
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 260,
	initial_rows = 65,
  --enable_tab_bar = false,
  --window_decorations = "NONE",
	window_decorations = "RESIZE",
	adjust_window_size_when_changing_font_size = false,
	selection_word_boundary = " \t\n{}[]()\"'`,;:",
	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},
  --window_background_gradient = {
  --  colors = { "#091320", "#7983b0" },
  --  -- Specifices a Linear gradient starting in the top left corner.
  --  orientation = { Linear = { angle = -45.0 } },
  --},
  -- 画像を背景に設定したいときはここをおん！上は消す
  --window_background_image = "/Users/h-3119/Pictures/6220eb96dfb9466df79eea50a4589c2b.jpeg",
  --  window_background_image_hsb = {
  --  -- Darken the background image by reducing it to 1/3rd
  --  brightness = 0.08,

  --  -- You can adjust the hue by scaling its value.
  --  -- a multiplier of 1.0 leaves the value unchanged.
  --  hue = 1.0,

  --  -- You can adjust the saturation also.
  --  saturation = 1.0,
  --},
  hyperlink_rules = {
    -- Defaults, don't edit
    -- URL
    -- example https://wezfurlong.org/wezterm/hyperlinks.html
    {
      regex = "\\b\\w+://(?:[\\w.-]+)[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- Email addresses
    -- exampel: ngominh.dang96@gmail.com
    {
      regex = "\\b[-_.A-Za-z0-9]+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
    -- file:// URI
    -- example: file:///Users/141217/.config/wezterm/wezterm.lua
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },

    -- Custom
    -- Open file at line for debug
    -- example: /Users/141217/work/repos/cdo-k8s-kops/k8s.dev.cdgfossil.com/s1.k8s.dev.cdgfossil.com.yaml:10:5
    {
      regex = "(?:[-.\\w@~/]+)?(?:/[.\\w\\-@]+)+:\\d+:\\d+",
      format = "$EDITOR:$0",
    },

  },
  window_background_opacity = 1.0,
	tab_bar_at_bottom = true,
	disable_default_key_bindings = false,
	-- visual_bell = {
	-- 	fade_in_function = "EaseIn",
	-- 	fade_in_duration_ms = 150,
	-- 	fade_out_function = "EaseOut",
	-- 	fade_out_duration_ms = 150,
	-- },
	keys = create_keybinds(),
}

return utils.merge_tables(config, local_config)
