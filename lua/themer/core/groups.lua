local config = require("themer.config").options
local config_colorscheme = require("themer.color_schemes.config")

local grouper = {}
grouper.get_groups = function (cp)
	local groups = {
		styles = {},
		virtual_text = {},
		underlines = {},
	}
	groups.styles = {
	    punctuation = { fg = cp.subtle },
	    comment = { fg = cp.subtle },
	    hint = { fg = cp.magenta },
	    info = { fg = cp.green },
	    warn = { fg = cp.yellow },
	    error = { fg = cp.red },
		functions = { fg = cp.blue },
		keywords = { fg = cp.magenta },
		strings = { fg = cp.green },
		variables = { fg = cp.fg },
		parameters = { fg = cp.yellow },
		fields = { fg = cp.red },
	}
	groups.virtual_text = {
		hint = { fg = groups.hint},
		warn = { fg =groups.warn},
		info = { fg=groups.info},
		error = { fg=groups.error},
	}
	groups.underlines = {
		hint = {sp=groups.hint},
		warn = {sp=groups.warn},
		info = {sp=groups.info},
		error = {sp=groups.error},
	}
	local vhygawd = vim.tbl_deep_extend("force", config_colorscheme.options or {}, config, config.integrations.native_lsp)
	groups = vim.tbl_deep_extend("force", groups, vhygawd)
	-- print(vim.inspect(config.styles))
	-- print(vim.inspect(config.integrations.native_lsp))
	-- print(vim.inspect(groups))
	return groups
end

return grouper
