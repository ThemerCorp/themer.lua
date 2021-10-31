local hi = {}

function hi.get(cp)
	local config = require("themer.config").options
	local virtual_text = require("themer.config").options.integrations.native_lsp.virtual_text
	local underlines = require("themer.config").options.integrations.native_lsp.underlines
	local groups = {
		punctuation = config.colors.punctuation or cp.subtle,
		comment = config.colors.comment or cp.subtle,
		hint = config.colors.hint or cp.magenta,
		info = config.colors.info or cp.green,
		warn = config.colors.warn or cp.yellow,
		error = config.colors.error or cp.red,
	}
	return {
		-- These groups are for the native LSP cliencp. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = cp.bg_alt }, -- used for highlighting "text" references
		LspReferenceRead = { bg = cp.bg_alt }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = cp.bg_alt }, -- used for highlighting "write" references
		-- hightlight diagnostics in numberline
		DiagnosticError = { fg = groups.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = groups.warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = groups.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = groups.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticDefaultError = { fg = groups.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultWarn = { fg = groups.warn }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultInfo = { fg = groups.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultHint = { fg = groups.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspSignatureActiveParameter = { fg = cp.orange },
		DiagnosticFloatingError = { bg = cp.bg_alt, fg = groups.error }, -- Used to color "Error" diagnostic messages in diagnostics float
		DiagnosticFloatingWarn = { bg = cp.bg_alt, fg = groups.warn }, -- Used to color"Warning" diagnostic messages in diagnostics float
		DiagnosticFloatingInfo = { bg = cp.bg_alt, fg = groups.info }, -- Used to color "Information" diagnostic messages in diagnostics float
		DiagnosticFloatingHint = { bg = cp.bg_alt, fg = groups.hint }, -- Used to color "Hint" diagnostic messages in diagnostics float

		DiagnosticVirtualTextError = vim.tbl_deep_extend("force", { fg = groups.error }, virtual_text.error), -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = vim.tbl_deep_extend("force", { fg = groups.warn }, virtual_text.warn), -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = vim.tbl_deep_extend("force", { fg = groups.info }, virtual_text.info), -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = vim.tbl_deep_extend("force", { fg = groups.hint }, virtual_text.hint), -- Used for "Hint" diagnostic virtual text
		DiagnosticUnderlineError = vim.tbl_deep_extend("force", { sp = groups.error }, underlines.error), -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = vim.tbl_deep_extend("force", { sp = groups.warn }, underlines.warn), -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = vim.tbl_deep_extend("force", { sp = groups.info }, underlines.info), -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = vim.tbl_deep_extend("force", { sp = groups.hint }, underlines.hint), -- Used to underline "Hint" diagnostics

		-- i am too lazy to link these
		-- any one willing to link these to the above ones, then sir you are welcome to do it anytime and do not forget to open a pr so i can merge it asap

		-- hightlight diagnostics in numberline
		LspDiagnosticsError = { fg = groups.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsWarning = { fg = groups.warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsInformation = { fg = groups.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsHint = { fg = groups.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		LspDiagnosticsDefaultError = { fg = groups.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarning = { fg = groups.warn }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInformation = { fg = groups.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint = { fg = groups.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspLspSignatusreActiveParameter = { fg = cp.orange },
		LspDiagnosticsFloatingError = { bg = cp.bg_alt, fg = groups.error }, -- Used to color "Error" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingWarning = { bg = cp.bg_alt, fg = groups.warn }, -- Used to color"Warning" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingInformation = { bg = cp.bg_alt, fg = groups.info }, -- Used to color "Information" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingHint = { bg = cp.bg_alt, fg = groups.hint }, -- Used to color "Hint" diagnostic messages in diagnostics float

		LspDiagnosticsVirtualTextError = vim.tbl_deep_extend("force", { fg = groups.error }, virtual_text.error), -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning = vim.tbl_deep_extend("force", { fg = groups.warn }, virtual_text.warn), -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation = vim.tbl_deep_extend("force", { fg = groups.info }, virtual_text.info), -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = vim.tbl_deep_extend("force", { fg = groups.hint }, virtual_text.hint), -- Used for "Hint" diagnostic virtual text
		LspDiagnosticsUnderlineError = vim.tbl_deep_extend("force", { sp = groups.error }, underlines.error), -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = vim.tbl_deep_extend("force", { sp = groups.warn }, underlines.warn), -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = vim.tbl_deep_extend("force", { sp = groups.info }, underlines.info), -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = vim.tbl_deep_extend("force", { sp = groups.hint }, underlines.hint), -- Used to underline "Hint" diagnostics

		LspCodeLens = { fg = cp.subtle }, -- virtual text of the codelens
	}
end

return hi
