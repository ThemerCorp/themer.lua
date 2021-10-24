local M = {}

function M.get(cpt)

	local virtual_text = require("themer.config").options.integrations.native_lsp.virtual_text
	local underlines = require("themer.config").options.integrations.native_lsp.underlines

	return {
		-- These groups are for the native LSP cliencpt. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = cpt.fg_gutter }, -- used for highlighting "text" references
		LspReferenceRead = { bg = cpt.fg_gutter }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = cpt.fg_gutter }, -- used for highlighting "write" references
		
		-- hightlight diagnostics in numberline
		DiagnosticError = { fg = cpt.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = cpt.warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = cpt.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = cpt.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticDefaultError = { fg = cpt.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultWarn = { fg = cpt.warn }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultInfo = { fg = cpt.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultHint = { fg = cpt.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspSignatureActiveParameter = { fg = cpt.orange },
		DiagnosticFloatingError         = { fg = cpt.error }, -- Used to color "Error" diagnostic messages in diagnostics float
		DiagnosticFloatingWarn       = { fg = cpt.warn }, -- Used to color"Warning" diagnostic messages in diagnostics float
		DiagnosticFloatingInfo   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
		DiagnosticFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

		DiagnosticError = { fg = cpt.error },
		DiagnosticWarn = { fg = cpt.warn },
		DiagnosticInfo = { fg = cpt.info },
		DiagnosticHint = { fg = cpt.hint },
		DiagnosticVirtualTextError = { fg = cpt.error, style = virtual_text.errors }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { fg = cpt.warn, style = virtual_text.warnings }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { fg = cpt.info, style = virtual_text.Warns }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { fg = cpt.hint, style = virtual_text.hints }, -- Used for "Hint" diagnostic virtual text
		DiagnosticUnderlineError = { style = underlines.errors, sp = cpt.error }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { style = underlines.warnings, sp = cpt.warn }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { style = underlines.information, sp = cpt.info }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { style = underlines.hints, sp = cpt.hint }, -- Used to underline "Hint" diagnostics
		
	
		-- Legacy support (will remove after 0.6 release :P)	
		LspDiagnosticError = { fg = cpt.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticWarn = { fg = cpt.warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticInfo = { fg = cpt.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticHint = { fg = cpt.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		LspDiagnosticsDefaultError = { fg = cpt.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarning = { fg = cpt.warn }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInformation = { fg = cpt.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint = { fg = cpt.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspLspSignatureActiveParameter = { fg = cpt.orange },
		LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingWarning       = { }, -- Used to color"Warning" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

		LspDiagnosticsError = { fg = cpt.error },
		LspDiagnosticsWarning = { fg = cpt.warn },
		LspDiagnosticsInformation = { fg = cpt.info },
		LspDiagnosticsHint = { fg = cpt.hint },
		LspDiagnosticsVirtualTextError = { fg = cpt.error, style = virtual_text.errors }, -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning = { fg = cpt.warn, style = virtual_text.warnings }, -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation = { fg = cpt.info, style = virtual_text.warnings }, -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = { fg = cpt.hint, style = virtual_text.hints }, -- Used for "Hint" diagnostic virtual text
		LspDiagnosticsUnderlineError = { style = underlines.errors, sp = cpt.error }, -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = { style = underlines.warnings, sp = cpt.warn }, -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = { style = underlines.information, sp = cpt.info }, -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = { style = underlines.hints, sp = cpt.hint }, -- Used to underline "Hint" diagnostics
	
		LspCodeLens = { fg = cpt.comment }, -- virtual text of the codelens
	}
end

return M 
