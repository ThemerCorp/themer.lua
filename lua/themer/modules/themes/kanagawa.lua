local colors = {

    -- Bg Shades
    sumiInk0 = "#16161D",
    sumiInk1b = "#181820",
    sumiInk1 = "#1F1F28",
    sumiInk2 = "#2A2A37",
    sumiInk3 = "#363646",
    sumiInk4 = "#54546D",

    -- Popup and Floats
    waveBlue1 = "#223249",
    waveBlue2 = "#2D4F67",

    -- Diff and Git
    winterGreen = "#2B3328",
    winterYellow = "#49443C",
    winterRed = "#43242B",
    winterBlue = "#252535",
    autumnGreen = "#76946A",
    autumnRed = "#C34043",
    autumnYellow = "#DCA561",

    -- Diag
    samuraiRed = "#E82424",
    roninYellow = "#FF9E3B",
    waveAqua1 = "#6A9589",
    dragonBlue = "#658594",

    -- Fg and Comments
    oldWhite = "#C8C093",
    fujiWhite = "#DCD7BA",
    fujiGray = "#727169",
    springViolet1 = "#938AA9",

    oniViolet = "#957FB8",
    crystalBlue = "#7E9CD8",
    springViolet2 = "#9CABCA",
    springBlue = "#7FB4CA",
    lightBlue = "#A3D4D5", -- unused yet
    waveAqua2 = "#7AA89F", -- improve lightness: desaturated greenish Aqua

    -- waveAqua2  = "#68AD99",
    -- waveAqua4  = "#7AA880",
    -- waveAqua5  = "#6CAF95",
    -- waveAqua3  = "#68AD99",

    springGreen = "#98BB6C",
    boatYellow1 = "#938056",
    boatYellow2 = "#C0A36E",
    carpYellow = "#E6C384",

    sakuraPink = "#D27E99",
    waveRed = "#E46876",
    peachRed = "#FF5D62",
    surimiOrange = "#FFA066",
    katanaGray = "#717C7C",
}

local cp = {
    -- Legacy colors for compatibility
    red = "#C34043",
    yellow = "#C0A36E",
    orange = colors.surimiOrange,
    magenta = "#957FB8",
    blue = "#7E9CD8",
    green = "#76946A",
    cyan = "#6A9589",

    -- The new shiny boy
    fg = colors.fujiWhite,
    diff = {
        add = colors.winterGreen,
        delete = colors.winterRed,
        change = colors.winterBlue,
        text = colors.winterYellow,
    },
    accent = colors.springBlue,
    search_result = { fg = colors.fujiWhite, bg = colors.waveBlue2, telescope = colors.fujiWhite },
    match = colors.crystalBlue,
    dimmed = {
        inactive = colors.sumiInk4,
        subtle = colors.fujiGray,
    },
    bg = {
        base = colors.sumiInk1,
        alt = colors.sumiInk0,
        selected = colors.waveBlue1,
    },
    border = colors.sumiInk4,
    syntax = {
        statement = colors.oniViolet,
        ["function"] = colors.crystalBlue,
        variable = colors.fujiWhite,
        include = colors.surimiOrange,
        keyword = colors.oniViolet,
        struct = colors.waveAqua2,
        string = colors.springGreen,
        field = colors.carpYellow,
        parameter = colors.carpYellow,
        property = colors.carpYellow,
        punctuation = colors.springViolet2,
        constructor = colors.oniViolet,
        operator = colors.boatYellow2,
        preproc = colors.surimiOrange,
        constant = colors.surimiOrange,
        todo = { bg = "NONE", fg = colors.dragonBlue },
        number = colors.sakuraPink,
        comment = colors.fujiGray,
        type = colors.waveAqua2,
        conditional = colors.oniViolet,
    },
    built_in = {
        ["function"] = colors.springBlue,
        type = colors.waveAqua2,
        variable = colors.waveRed,
        keyword = colors.oniViolet,
        constant = colors.surimiOrange,
    },
    diagnostic = {
        error = colors.samuraiRed,
        warn = colors.roninYellow,
        info = colors.dragonBlue,
        hint = colors.waveAqua1,
    },
    inc_search = { fg = colors.waveBlue1, bg = colors.roninYellow },
    uri = colors.springBlue,
    pum = {
        fg = colors.fujiWhite,
        bg = colors.waveBlue1,
        sbar = colors.waveBlue1,
        thumb = colors.waveBlue2,
        sel = {
            bg = colors.waveBlue2,
            fg = "NONE",
        },
    },
    heading = {
        h1 = colors.crystalBlue,
        h2 = colors.crystalBlue,
    },
}

cp.remaps = {
    themer = {
        GitSignsAdd = { fg = colors.autumnGreen },
        GitSignsDelete = { fg = colors.autumnRed },
        GitSignsChange = { fg = colors.autumnYellow },
    },
}

return cp
