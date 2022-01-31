-- kurai color palette (https://github.com/kurai-theme/) © Shift
local palette = {
    light = "#f4f0f4",
    reflex = "#e9e2e9",
    void = "#1a181b",
    graphite = "#272428",
    steel = "#343036",
    ash = "#68616b",
    water_splash = "#8f9fef",
    water_wave = "#4c66e6",
    spring_grass = "#8fef97",
    summer_grass = "#4ce659",
    dry_sand = "#ffff80",
    sour_lemon = "#ffff33",
    sea_coral = "#ff8080",
    wild_rose = "#ff3333",
    summer_tan = "#ffbf80",
    fresh_orange = "#ff9933",
    nebula_light = "#ca80ff",
    nebula_neutral = "#aa33ff",
    nebula_vibrant = "#9500ff",
    nebula_deep = "#7f20df",
    nebula_void = "#661fad",
}

local cp = {
    -- Legacy
    red = palette.wild_rose,
    yellow = palette.dry_sand,
    orange = palette.fresh_orange,
    magenta = palette.nebula_vibrant,
    blue = palette.water_wave,
    green = palette.summer_grass,
    cyan = palette.water_splash,

    -- 0.1
    fg = palette.reflex,
    bg = {
        base = palette.graphite,
        alt = palette.void,
        selected = palette.steel,
    },
    dimmed = {
        inactive = palette.steel,
        subtle = palette.steel,
    },
    diff = {
        add = palette.spring_grass,
        delete = palette.wild_rose,
        change = palette.dry_sand,
        text = palette.water_splash,
    },
    accent = palette.nebula_vibrant,
    inc_search = { fg = palette.light, bg = palette.nebula_light },
    search_result = {
        fg = palette.reflex,
        bg = palette.water_splash,
        telescope = palette.reflex,
    },
    match = palette.water_wave,
    border = palette.steel,
    uri = palette.nebula_void,
    heading = {
        h1 = palette.spring_grass,
        h2 = palette.summer_grass,
    },
    syntax = {
        statement = palette.nebula_light,
        ["function"] = palette.water_splash,
        variable = palette.reflex,
        include = palette.summer_tan,
        keyword = palette.nebula_light,
        struct = palette.water_wave,
        string = palette.dry_sand,
        field = palette.water_splash,
        parameter = palette.nebula_light,
        property = palette.water_wave,
        punctuation = palette.ash,
        constructor = palette.nebula_deep,
        operator = palette.nebula_light,
        preproc = palette.dry_sand,
        constant = palette.sour_lemon,
        todo = { fg = palette.light, bg = palette.nebula_neutral },
        number = palette.sea_coral,
        comment = palette.ash,
        ["type"] = palette.spring_grass,
        conditional = palette.nebula_light,
    },
    built_in = {
        ["function"] = palette.water_splash,
        ["type"] = palette.spring_green,
        variable = palette.sea_coral,
        keyword = palette.sea_coral,
        constant = palette.dry_sand,
    },
    diagnostic = {
        ["error"] = palette.wild_rose,
        warn = palette.sour_lemon,
        info = palette.nebula_vibrant,
        hint = palette.water_wave,
    },
    pum = {
        fg = palette.reflex,
        bg = palette.void,
        sbar = palette.graphite,
        thumb = palette.reflex,
        sel = {
            bg = palette.graphite,
            fg = palette.reflex,
        },
    },
}

cp.remaps = {
    plugins = {
        cmp = {
            CmpItemAbbrDeprecated = { fg = palette.wild_rose },
            CmpItemAbbrMatch = { fg = palette.nebula_vibrant },
            CmpItemAbbrMatchFuzzy = { fg = palette.nebula_vibrant },
            CmpItemMenu = { fg = palette.summer_grass },
        },
        telescope = {
            TelescopeSelection = { bg = palette.steel },
            TelescopeMatching = { bg = palette.water_splash },
            TelescopeBorder = { fg = palette.void, bg = palette.void },
            TelescopePromptCounter = { fg = palette.nebula_vibrant },
            TelescopePromptPrefix = { fg = palette.fresh_orange },
            TelescopeResultsTitle = { fg = palette.void, bg = palette.water_wave },
            TelescopePreviewTitle = { fg = palette.void, bg = palette.spring_grass },
            TelescopePromptTitle = { fg = palette.void, bg = palette.dry_sand },
            TelescopePreviewNormal = { bg = palette.void },
            TelescopeResultsNormal = { bg = palette.void },
            TelescopePromptNormal = { fg = palette.reflex, bg = palette.void },
            TelescopePromptBorder = { fg = palette.reflex, bg = palette.void },
            TelescopeSelectionCaret = { fg = palette.nebula_void, bg = palette.void },
        },
    }
}

return cp
