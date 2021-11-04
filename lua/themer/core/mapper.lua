local config = require("themer.config").options

---@class mapper
local mapper = {}

---return the basic hig groups
---@param cp table
---@return table
function mapper.get_base(cp)
    local groups = {
        punctuation = config.colors.punctuation or cp.subtle,
        comment = config.colors.comment or cp.subtle,
        hint = config.colors.hint or cp.magenta,
        info = config.colors.info or cp.green,
        warn = config.colors.warn or cp.yellow,
        error = config.colors.error or cp.red,
    }

    local maybe_bold_vert_split = { fg = cp.bg_float }
    if config.bold_vertical_split_line then
        maybe_bold_vert_split = { fg = cp.bg_alt, bg = cp.bg_alt }
    end
    local base = {
        ColorColumn = { bg = cp.highlight_overlay },
        Conceal = { bg = cp.none },
        -- Cursor = {},
        CursorColumn = { bg = cp.highlight },
        -- CursorIM = {},
        CursorLine = { bg = cp.highlight_inactive },
        CursorLineNr = { fg = cp.fg },
        DarkenedPanel = { bg = cp.bg_alt },
        DarkenedStatusline = { bg = cp.bg_alt },
        DiffAdd = { fg = cp.green },
        DiffChange = { fg = cp.orange },
        DiffDelete = { fg = cp.red },
        DiffText = { fg = cp.fg },
        Directory = { fg = cp.green, bg = cp.none },
        EndOfBuffer = { bg = config.transparency and "NONE" or cp.bg },
        ErrorMsg = { fg = cp.red, bold = true },
        FloatBorder = { fg = cp.subtle },
        FoldColumn = {},
        Folded = { fg = cp.fg, bg = config.transparency and "NONE" or cp.bg_alt },
        IncSearch = { bg = cp.highlight },
        LineNr = { fg = cp.inactive },
        MatchParen = { fg = cp.fg, bg = cp.bg_float },
        -- ModeMsg = {},
        MoreMsg = { fg = cp.magenta },
        NonText = { fg = cp.inactive },
        Normal = { fg = cp.fg, bg = config.transparency and cp.none or cp.bg },
        NormalNC = { link = "Normal" },
        -- NormalFloat = {},
        Pmenu = { fg = cp.subtle, bg = cp.bg_alt },
        PmenuSbar = { bg = cp.bg_float },
        PmenuSel = { fg = cp.fg, bg = cp.bg_float },
        PmenuThumb = { bg = cp.inactive },
        Question = { fg = cp.yellow },
        -- QuickFixLine = {},
        Search = { fg = cp.magenta, bg = cp.highlight_overlay },
        SpecialKey = { fg = cp.green },
        SpellBad = { undercurl = true, sp = cp.red },
        SpellCap = { undercurl = true, sp = cp.subtle },
        SpellLocal = { undercurl = true, sp = cp.subtle },
        SpellRare = { undercurl = true, sp = cp.subtle },
        SignColumn = { fg = cp.fg, bg = config.transparency and "NONE" or cp.bg },
        StatusLine = { fg = cp.fg, bg = cp.bg_alt },
        StatusLineNC = { fg = cp.subtle, bg = cp.bg_alt },
        -- StatusLineTerm = {},
        -- StatusLineTermNC = {},
        TabLine = { fg = cp.subtle, bg = cp.bg_float },
        TabLineFill = { bg = cp.bg_alt },
        TabLineSel = { fg = cp.fg, bg = cp.inactive },
        Title = { fg = cp.fg },
        VertSplit = maybe_bold_vert_split,
        Visual = { bg = cp.highlight },
        -- VisualNOS = {},
        WarningMsg = { fg = cp.yellow },
        -- Whitespace = {},
        -- WildMenu = {},
        Boolean = { fg = cp.yellow },
        Character = { fg = cp.yellow },
        Comment = vim.tbl_deep_extend("force", { fg = groups.comment }, config.styles.comments),
        Conditional = { fg = cp.blue },
        Constant = { fg = cp.yellow },
        Debug = { fg = cp.orange },
        Define = { fg = cp.magenta },
        Delimiter = { fg = cp.orange },
        Error = { fg = cp.red },
        Exception = { fg = cp.blue },
        Float = { fg = cp.yellow },
        Function = vim.tbl_deep_extend("force", { fg = cp.orange }, config.styles.functions),
        Identifier = vim.tbl_deep_extend("force", { fg = cp.orange }, config.styles.variables),
        -- Ignore = { fg = '' },
        Include = { fg = cp.magenta },
        Keyword = vim.tbl_deep_extend("force", { fg = cp.orange }, config.styles.keywords),
        Label = { fg = cp.green },
        Macro = { fg = cp.magenta },
        Number = { fg = cp.yellow },
        Operator = { fg = cp.subtle },
        PreCondit = { fg = cp.magenta },
        PreProc = { fg = cp.magenta },
        Repeat = { fg = cp.blue },
        Special = { fg = cp.orange },
        SpecialChar = { fg = cp.orange },
        SpecialComment = { fg = cp.magenta },
        Statement = { fg = cp.blue },
        StorageClass = { fg = cp.green },
        String = vim.tbl_deep_extend("force", { fg = cp.yellow }, config.styles.strings),
        Structure = { fg = cp.green },
        Tag = { fg = cp.orange },
        Todo = { fg = cp.magenta },
        Type = { fg = cp.green },
        Typedef = { fg = cp.green },
        Underlined = { fg = cp.green, underline = true },

        htmlArg = { fg = cp.magenta },
        htmlEndTag = { fg = cp.subtle },
        htmlLink = { fg = cp.fg },
        htmlTag = { fg = cp.subtle },
        htmlTagN = { fg = cp.fg },
        htmlTagName = { fg = cp.green },
    }

    return base
end

---return the final integrations table
---@param cp table
---@return table
function mapper.get_integrations(cp)
    local integrations = config["integrations"]
    local final_integrations = {}

    for integration in pairs(integrations) do
        local cot = false
        if type(integrations[integration]) == "table" then
            if integrations[integration]["enabled"] == true then
                cot = true
            end
        else
            if integrations[integration] == true then
                cot = true
            end
        end

        if cot then
            final_integrations = vim.tbl_deep_extend(
                "force",
                final_integrations,
                require(table.concat({ "themer.core.integrations.", integration })).get(cp)
            )
        end
    end

    final_integrations = vim.tbl_deep_extend(
        "force",
        final_integrations,
        require("themer.core.remaps").get_hig_remaps() or {}
    )
    return final_integrations
end

---get color scheme properties
---@param cp table
---@return table
function mapper.get_properties(cp)
    local props = {
        termguicolors = true,
        background = cp.flavour or "dark",
    }
    return props
end

---return theme table containing highlights
---@param cp table
---@return table
function mapper.apply(cp)
    local theme = {}
    theme.colors = cp
    theme.base = mapper.get_base(cp)
    theme.integrations = mapper.get_integrations(cp)
    theme.properties = mapper.get_properties(cp)

    return theme
end

return mapper
