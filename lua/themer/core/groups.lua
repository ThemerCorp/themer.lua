local config = require("themer.config").options
local config_colorscheme = require("themer.color_schemes.config")

local grouper = {}
grouper.get_groups = function (cp)
	local groups = {
	    punctuation = { fg = cp.subtle },
	    comment = { fg = cp.subtle },
	    hint = { fg = cp.magenta },
	    info = { fg = cp.green },
	    warn = { fg = cp.yellow },
	    error = { fg = cp.red },
		functions = { fg = cp.orange },
		keywords = { fg = cp.orange },
		strings = { fg = cp.yellow },
		variables = { fg = cp.orange },
		parameters = { fg = cp.yellow },
		fields = { fg = cp.red },
		virtual_text = {},
		underlines = {},
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
	groups = vim.tbl_deep_extend("force", config_colorscheme or {}, config.styles, config.integrations.native_lsp)
	-- print(vim.inspect(config.styles))
	-- print(vim.inspect(config.integrations.native_lsp))
	-- print(vim.inspect(groups))
	return groups
end

return grouper
