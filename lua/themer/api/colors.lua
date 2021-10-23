local api = {}

api.get_color_scheme = function (cs)
	local ok, csc = pcall(require, table.concat({"themer.color_schemes.", cs}))
	local remaps = require("themer.core.remaps").get_cs_remaps() or {}

	if not ok then
		return {
			status = false,
			msg = table.concat({"Themer: The colorscheme", cs, "was not recognized"}, " "),
		}
	end

	if not(next(remaps) == nil) then
		return { status = true, color_scheme = vim.tbl_deep_extend("force", csc, remaps)}
	else
		return { status = true, color_scheme = csc }
	end
end

return api
