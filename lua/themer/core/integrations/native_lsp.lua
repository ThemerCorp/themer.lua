local M = {}

function M.get(cp)

	local virtual_text = require("themer.config").options.integrations.native_lsp.virtual_text
	local underlines = require("themer.config").options.integrations.native_lsp.underlines

	return {
		-- These groups are for the native LSP cliencp. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = cp.fg_gutter }, -- used for highlighting "text" references
		LspReferenceRead = { bg = cp.fg_gutter }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = cp.fg_gutter }, -- used for highlighting "write" references
		-- hightlight diagnostics in numberline
		DiagnosticError = { fg = cp.red_br }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = cp.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = cp.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = cp.white_br }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticDefaultError = { fg = cp.red_br }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultWarn = { fg = cp.yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultInfo = { fg = cp.blue }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		DiagnosticDefaultHint = { fg = cp.white_br }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspSignatureActiveParameter = { fg = cp.orange },
		DiagnosticFloatingError         = { bg = cp.bg_alt, fg = cp.red_br }, -- Used to color "Error" diagnostic messages in diagnostics float
		DiagnosticFloatingWarn       = { bg = cp.bg_alt, fg = cp.yellow }, -- Used to color"Warning" diagnostic messages in diagnostics float
		DiagnosticFloatingInfo   = { bg = cp.bg_alt, fg = cp.blue }, -- Used to color "Information" diagnostic messages in diagnostics float
		DiagnosticFloatingHint          = { bg = cp.bg_alt, fg = cp.white_br }, -- Used to color "Hint" diagnostic messages in diagnostics float

		DiagnosticVirtualTextError = vim.tbl_deep_extend("force", { fg = cp.red_br }, virtual_text.errors),-- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.warnings),-- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.information),-- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.hints),-- Used for "Hint" diagnostic virtual text
		DiagnosticUnderlineError = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.errors),-- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.warnings),-- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.information),-- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.hints), -- Used to underline "Hint" diagnostics
		

		-- for those users using old versions (i will remove it after neovim 0.6 release)
		LspDiagnosticsError = { fg = cp.red_br }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsWarn = { fg = cp.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsInfo = { fg = cp.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		LspDiagnosticsHint = { fg = cp.white_br }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		LspDiagnosticsDefaultError = { fg = cp.red_br }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarn = { fg = cp.yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInfo = { fg = cp.blue }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint = { fg = cp.white_br }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsFloatingError         = { bg = cp.bg_alt, fg = cp.red_br }, -- Used to color "Error" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingWarn       = { bg = cp.bg_alt, fg = cp.yellow }, -- Used to color"Warning" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingInfo   = { bg = cp.bg_alt, fg = cp.blue }, -- Used to color "Information" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingHint          = { bg = cp.bg_alt, fg = cp.white_br }, -- Used to color "Hint" diagnostic messages in diagnostics float

		LspDiagnosticsVirtualTextError = vim.tbl_deep_extend("force", { fg = cp.red_br }, virtual_text.errors),-- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarn = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.warnings),-- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInfo = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.information),-- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = vim.tbl_deep_extend("force", { fg = cp.white_br }, virtual_text.hints),-- Used for "Hint" diagnostic virtual text
		LspDiagnosticsUnderlineError = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.errors),-- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarn = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.warnings),-- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInfo = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.information),-- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = vim.tbl_deep_extend("force", { sp = cp.white_br }, underlines.hints), -- Used to underline "Hint" diagnostics


		LspCodeLens = { fg = cp.comment }, -- virtual text of the codelens
	}
end

return M
