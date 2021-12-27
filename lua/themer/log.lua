---logs using vim.notify()
---@param msg string message
---@param level string log level
---@param plugin string plugin name
return function(msg, level, plugin)
	vim.notify(msg, level, {
		title = plugin,
		timeout = 200,
	})

	return
end
