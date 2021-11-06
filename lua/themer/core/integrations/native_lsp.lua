local hi = {}

function hi.get(cp)
    local groups = require("themer.core.groups").get_groups(cp)
    return {
        -- These groups are for the native LSP cliencp. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's
        -- documentation.
        LspReferenceText = { bg = cp.bg_alt }, -- used for highlighting "text" references
        LspReferenceRead = { bg = cp.bg_alt }, -- used for highlighting "read" references
        LspReferenceWrite = { bg = cp.bg_alt }, -- used for highlighting "write" references
        -- hightlight diagnostics in numberline
        DiagnosticError = groups.error, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = groups.warn, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = groups.info, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = groups.hint, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

        DiagnosticDefaultError = groups.error, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticDefaultWarn = groups.warn, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticDefaultInfo = groups.info, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticDefaultHint = groups.hint, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticFloatingError = { bg = cp.bg_alt, fg = groups.error.fg }, -- Used to color "Error" diagnostic messages in diagnostics float
        DiagnosticFloatingWarn = { bg = cp.bg_alt, fg = groups.warn.fg }, -- Used to color"Warning" diagnostic messages in diagnostics float
        DiagnosticFloatingInfo = { bg = cp.bg_alt, fg = groups.info.fg }, -- Used to color "Information" diagnostic messages in diagnostics float
        DiagnosticFloatingHint = { bg = cp.bg_alt, fg = groups.hint.fg }, -- Used to color "Hint" diagnostic messages in diagnostics float

        DiagnosticVirtualTextError = groups.virtual_text.error,
        DiagnosticVirtualTextWarn = groups.virtual_text.warn,
        DiagnosticVirtualTextInfo = groups.virtual_text.info,
        DiagnosticVirtualTextHint = groups.virtual_text.hint,
        DiagnosticUnderlineError = groups.underlines.error,
        DiagnosticUnderlineWarn = groups.underlines.warn,
        DiagnosticUnderlineInfo = groups.underlines.info,
        DiagnosticUnderlineHint = groups.underlines.hint,

        -- hightlight diagnostics in numberline
        LspDiagnosticsError = { link = "DiagnosticError" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        LspDiagnosticsWarning = { link = "DiagnosticWarn" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        LspDiagnosticsInformation = { link = "DiagnosticInfo" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        LspDiagnosticsHint = { link = "DiagnosticHint" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

        LspDiagnosticsDefaultError = { link = "DiagnosticDefaultError" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultWarning = { link = "DiagnosticDefaultWarn" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultInformation = { link = "DiagnosticDefaultInfo" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultHint = { link = "DiagnosticDefaultHint" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsFloatingError = { link = "DiagnosticFloatingError" }, -- Used to color "Error" diagnostic messages in diagnostics float
        LspDiagnosticsFloatingWarning = { link = "DiagnosticFloatingWarn" }, -- Used to color"Warning" diagnostic messages in diagnostics float
        LspDiagnosticsFloatingInformation = { link = "DiagnosticFloatingInfo" }, -- Used to color "Information" diagnostic messages in diagnostics float
        LspDiagnosticsFloatingHint = { link = "DiagnosticFloatingHint" }, -- Used to color "Hint" diagnostic messages in diagnostics float

        LspDiagnosticsVirtualTextError = { link = "DiagnosticVirtualTextError" },
        LspDiagnosticsVirtualTextWarning = { link = "DiagnosticVirtualTextWarn" },
        LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
        LspDiagnosticsVirtualTextHint = { link = "DiagnosticVirtualTextHint" },
        LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
        LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
        LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInfo" },
        LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" },

        LspSignatureActiveParameter = { fg = cp.orange },
        LspCodeLens = { fg = cp.subtle }, -- virtual text of the codelens
    }
end

return hi
