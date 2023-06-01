-- https://github.com/ivaquero/oxidizer/blob/master/defaults/wezterm.lua

local wezterm = require 'wezterm'

local launch_menu = {}
local default_prog = {}

-- Shell
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert( launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' }
     } )
    table.insert( launch_menu, {
        label = "WSL",
        args = { "wsl.exe", "--cd", "/home/" }
     } )
    default_prog = { 'powershell.exe', '-NoLogo' }
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    table.insert( launch_menu, {
        label = 'Bash',
        args = { 'bash', '-l' }
     } )
    default_prog = { 'bash', '-l' }
else
    table.insert( launch_menu, {
        label = 'Zsh',
        args = { 'zsh', '-l' }
     } )
    default_prog = { 'zsh', '-l' }
end

-- Title
function basename( s )
    return string.gsub( s, '(.*[/\\])(.*)', '%2' )
end

wezterm.on( 'format-tab-title', function( tab, tabs, panes, config, hover, max_width )
    local pane = tab.active_pane

    local index = ""
    if #tabs > 1 then
        index = string.format( "%d: ", tab.tab_index + 1 )
    end

    local process = basename( pane.foreground_process_name )

    return { {
        Text = ' ' .. index .. process .. ' '
     } }
end )

return {
	font = wezterm.font_with_fallback { 'JetBrains Mono' },
<<<<<<< HEAD
	font_size = 12,
=======
	font_size = 10,
>>>>>>> f0231b765293d61118efca4ed87a5d931aa8dc97
	freetype_load_target = "Mono",

	window_background_opacity = 0.8,

	color_scheme = 'Monokai Dark (Gogh)',

	default_prog = default_prog,
    launch_menu = launch_menu,

	leader = { key = ',', mods = 'CTRL' },

	keys = {
		-- New/close tab
		{ key = 't', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' }, 
		{ key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
        -- New/close pane
        { key = 'h', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'v', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'c', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
        -- Pane navigation
        { key = 'l', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'h', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'k', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'j', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Down' },
	},
}
