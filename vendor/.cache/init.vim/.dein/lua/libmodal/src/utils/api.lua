--[[
	/*
	 * MODULE
	 */
--]]

local api = vim.api

------------------------
--[[ SUMMARY:
	* Make vim ring the visual/audio bell, if it is enabled.
]]
------------------------
function api.nvim_bell()
	api.nvim_command('normal ' .. string.char(27)) -- escape char
end

------------------------------------
--[[ SUMMARY:
	* Check whether or not some variable exists.
]]
--[[ PARAMS:
	* `scope` => The scope of the variable (i.e. `g`, `l`, etc.)
	* `var` => the variable to check for.
]]
------------------------------------
function api.nvim_exists(scope, var)
	return api.nvim_call_function('exists', {scope .. ':' .. var}) == require('libmodal/src/globals').VIM_TRUE
end

-------------------------
--[[ SUMMARY:
	* Gets one character of user input, as a number.
]]
--[[ REMARKS:
	* This could also be:
	```lua
	local cmd = {
		'"while 1"',
			'"let c = getchar(0)"',
			'"if empty(c)"',
				'"sleep 20m"',
			'"else"',
				'"echo c"',
				'"break"',
			'"endif"',
		'"endwhile"'
	}

	return tonumber(vim.api.nvim_call_function("execute",cmd))
	```
	However, I'm not sure if it would accidentally affect text.
]]
-------------------------
function api.nvim_input()
	return api.nvim_call_function('getchar', {})
end

---------------------------------
--[[ SUMMARY:
	* Echo a table of {`hlgroup`, `str`} tables.
	* Meant to be read as "nvim list echo".
]]
--[[ PARAMS:
	* `hlTables` => the tables to echo with highlights.
]]
---------------------------------
local lecho_template = {
	[1] = "echohl ",
	[2] = nil,
	[3] = " | echon '",
	[4] = nil,
	[5] = "'"
}
function api.nvim_lecho(hlTables)
	api.nvim_redraw()
	for _, hlTable in ipairs(hlTables) do
		-- `:echohl` the hlgroup and then `:echon` the string
		lecho_template[2] = tostring(hlTable.hl)
		lecho_template[4] = tostring(hlTable.str)

		api.nvim_command(table.concat(lecho_template))
	end
	api.nvim_command('echohl None')
end

--------------------------
--[[ SUMMARY:
	* Run `mode` to refresh the screen.
	* The function was not named `nvim_mode` because that would be really confusing given the name of this plugin.
]]
--------------------------
function api.nvim_redraw()
	api.nvim_command('mode')
end

--------------------------------------
--[[ SUMMARY:
	* Show a `title` error.
]]
--[[ PARAMS:
	* `title` => the title of the error.
	* `msg` => the message of the error.
]]
--------------------------------------
-- local returnHighlightSegment = HighlightSegment.new('Question', '\nPress any key to return.')
function api.nvim_show_err(title, msg)
	local HighlightSegment = require('libmodal/src/Indicator/HighlightSegment')
	api.nvim_lecho({
		HighlightSegment.new('Title', tostring(title) .. '\n'),
		HighlightSegment.new('Error', tostring(msg)),
	})
	api.nvim_call_function('getchar', {})
end

--[[
	/*
	 * PUBLICIZE MODULE
	 */
--]]

return api