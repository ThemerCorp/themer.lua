<div align="center">

<img src="./assets/themer.png" width=315>
<h1>THEMER - AN ORGANISED COLORSCHEME WORLD</h1>

<h5>Colorifying neovim editors since 2021</h5>

<h2> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- BADGES -->
<a href="https://github.com/neovim/neovim"> <img src="https://img.shields.io/badge/requires-neovim%200.6%2B-green?color=%238dc776&labelColor=%23101415&style=for-the-badge&logo=neovim"> </a>
<a href="https://github.com/narutoxy/themer.lua/stargazers">
    <img src="https://img.shields.io/github/stars/narutoxy/themer.lua?color=%238dc776&labelColor=%23101415&style=for-the-badge">
</a>
<a href="https://github.com/narutoxy/themer.lua/network/members/">
    <img src="https://img.shields.io/github/forks/narutoxy/themer.lua?color=%2384a0c6&labelColor=%23101415&style=for-the-badge">
</a>
<img src="https://img.shields.io/github/repo-size/narutoxy/themer.lua?color=%23f65b5b&labelColor=%23101415&style=for-the-badge">
<a href="https://discord.gg/X5e3z24u">
  <img src="https://img.shields.io/discord/916917730542764062?color=bb8fe5&labelColor=101415&style=for-the-badge"/>
</a>
</div>

[Credits: Logo by Binx](#green_heart-credits)

# README WIP

# 🔧 Installation
- [Packer](https://github.com/wbthomason/packer.nvim)
```lua
    use({
        "~/projects/themer",
	event = "BufEnter",
        config = function()
            require("themer").setup({
                colorscheme = "kanagawa",
                styles = {
                  	["function"] = { style = 'italic' }, 
                   	functionbuiltin = { style = 'italic' }, 
                   	variable = { style = 'italic' }, 
                    	variablebuiltin = { style = 'italic' }, 
                  	parameter  = { style = 'italic' }, 
                },
            })
        end
    })
```

- [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'NarutoXY/themer.lua'
```

Now you can place this base configuration in your `init.vim` file:
```vim
lua << EOF
            require("themer").setup({
                colorscheme = "kanagawa",
                styles = {
                  	["function"] = { style = 'italic' }, 
                   	functionbuiltin = { style = 'italic' }, 
                   	variable = { style = 'italic' }, 
                    	variablebuiltin = { style = 'italic' }, 
                  	parameter  = { style = 'italic' }, 
                },
            })
EOF
```

or you can also place this in your `init.vim` file:
```vim
colorscheme themer_catppuccin
```

# 🍰 Supported Plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP diagnostics](https://neovim.io/doc/user/lsp.html)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Galaxyline.nvim](https://github.com/Ntbbloodbath/galaxyline.nvim)
- [BufferLine.nvim](https://github.com/akinsho/bufferline.nvim)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [Lualine.nvim](https://github.com/hoob3rt/lualine.nvim)

# 🌹 Supported colorschemes

|				   | Colorschemes     | Code Names         |
| ---------------- | ---------------- | ------------------ |
| ✅			   | Dark Catppuccino | `dark_cpt`         |
| ✅               | Rose Pine        | `rose_pine`        |
| ✅               | Rose Pine Moon        | `rose_pine_moon`        |
| ✅               | EverForest | `everforest`        |
| ✅               | Doom One        | `doom_one`        |
| ✅               | Rose Pine Dawn       | `rose_pine_dawn`        |
| ✅               | Dracula          | `dracula`          |
| ✅               | Papa Dark      | `papa_dark`          |
| ✅				| One Dark 		| `onedark`			|
| ✅				| Nord 		| `nord`			|
| ✅ | Kurai | `kurai` |

This list may not be updated. See [`lua/themer/color_schemes`](https://github.com/ThemerCorp/themer.lua/tree/main/lua/themer/color_schemes)

# 🧰 Configuring Themer
Heres the default config table
```lua
{
    colorscheme = "rose_pine", -- default colorscheme
    transparent = false,
    term_colors = true,
    dim_inactive = false,
    styles = {
        heading = {
            h1 = {},
            h2 = {},
        },
        ["function"] = {},
        functionBuiltIn = {},
        variable = {},
        variableBuiltIn = {},
        include = {},
        identifier = {},
        keyword = {},
        keywordBuiltIn = {},
        struct = {},
        string = {},
        parameter = {},
        field = {},
        type = {},
        typeBuiltIn = {},
        property = {},
        comment = {},
        punctuation = {},
        constructor = {},
        operator = {},
        constant = {},
        constantBuiltIn = {},
        todo = {},
        character = {},
        conditional = {},
        number = {},
        statement = {},
        uri = {},
        diagnostic = {
            underline = {
                error = {},
                warn = {},
                info = {},
                hint = {},
            },
            virtual_text = {
                error = {},
                warn = {},
                info = {},
                hint = {},
            },
        },
    },
    remaps = {
        palette = {},
        -- per colorscheme palette remaps, for example:
        -- remaps.palette = {
        --     rose_pine = {
        --     	fg = "#000000"
        --     }
        -- },
        -- would recommend to look into vim.api.nvim_set_hl() docs before using this
        -- remaps.highlights = {
        --     rose_pine = { 
	--	base = {
        --     	  Normal = { bg = "#000000" }
       	--	},
       	--     }
        -- },
        --
        -- Also you can do remaps.highlights.globals  for global highlight remaps
        highlights = {},
    },

    langs = {
        html = true,
        md = true,
    },

    plugins = {
        treesitter = true,
        indentline = true,
        barbar = true,
        bufferline = true,
        cmp = true,
        gitsigns = true,
        lsp = true,
        telescope = true,
    },
}
```

# 🧸 Extra Goodies

You can export current colorscheme to the following:
- XResources `:lua require("themer.export.xres").write_config()`
- Kitty `:lua require("themer.export.kitty").write_config()`
- Alacritty `:lua require("themer.export.alacritty").write_config()`
- Compiled Neovim colorscheme `:lua require("themer.export.nvim").write_config(require("themer.color_schemes.catppuccin"))` (PS: This one needs the color palette as the param)

# 🧑🏻‍🤝‍🧑🏼 Contributing

## Adding more plugin higs

All plugin highlight groups are in [`core/mapper.lua`](https://github.com/ThemerCorp/themer.lua/blob/main/lua/themer/core/mapper.lua)

Feel free to add new plugin hig groups in `availablePlugins` table and then tweaking `config.options.plugins` to add plugin to the list.

## Adding new colorscheme

Here's the palette you will need to follow

```lua
    -- Legacy colors for compatibility
    red = cpt.red,
    yellow = cpt.yellow,
    orange = cpt.peach,
    magenta = cpt.mauve,
    blue = cpt.blue,
    green = cpt.green,
    cyan = cpt.teal,

    -- The new shiny boy
    fg = cpt.white,
    diff = {
        add = cpt.green,
        remove = cpt.red,
        text = cpt.blue,
        change = cpt.yellow,
    },
    accent = cpt.blue,
    search_result = { fg = cpt.pink, bg = cpt.black4, telescope = cpt.blue },
    match = cpt.white,
    dimmed = {
        inactive = cpt.black4,
        subtle = cpt.gray0,
    },
    bg = {
        base = cpt.black2,
        alt = cpt.black1,
        selected = cpt.black3,
    },
    border = cpt.blue,
    syntax = {
        statement = cpt.mauve,
        ["function"] = cpt.blue,
        variable = cpt.fg,
        include = cpt.pink,
        keyword = cpt.red,
        struct = cpt.yellow,
        string = cpt.green,
        field = cpt.rosewater,
        parameter = cpt.flamingo,
        property = cpt.yellow,
        punctuation = cpt.teal,
        constructor = cpt.lavender,
        operator = cpt.sky,
        preproc = cpt.pink,
        constant = cpt.peach,
        todo = { fg = cpt.black4, bg = cpt.yellow },
        number = cpt.peach,
        comment = cpt.gray0,
        type = cpt.yellow,
        conditional = cpt.pink,
    },
    built_in = {
        ["function"] = cpt.peach,
        type = cpt.yellow,
        variable = cpt.teal,
        keyword = cpt.maroon,
        constant = cpt.lavender,
    },
    diagnostic = {
        error = cpt.red,
        warn = cpt.yellow,
        info = cpt.sky,
        hint = cpt.rosewater,
    },
    inc_search = { fg = "#575268", bg = "#f5c2e7" },
    uri = cpt.flamingo,
    pum = {
        fg = cpt.gray2,
        bg = cpt.black3,
        sbar = cpt.black4,
        thumb = cpt.gray0,
        sel = {
            bg = cpt.black4,
            fg = cpt.white,
        },
    },
    heading = {
        h1 = cpt.pink,
        h2 = cpt.blue,
    },
    remaps = {}, -- all your hig groups remaps go here, follow the structure in core/mapper.lua
```
Also add the theme name to `README` and add it to `colors/`

## Using themer to make your colorscheme plugin
You can use `lua/themer/export/nvim.lua` to create a single file (with no dependancy on themer) and can use that for creating your colorscheme plugin easily.
Also contribute theme palette to themer, if possible.

# :green_heart: Credits
Massive shoutouts to the people who supported the project! These are:
- Binx, for making that gorgeous logo for free!
    - [Github](https://github.com/Binx-Codes/)
    - [Reddit](https://www.reddit.com/u/binxatmachine)
- Papa Megamind
- TarunDaCoder
    - [Github](https://github.com/tarundacoder/)
- Gilfoyle
    - [Github](https://github.com/tamton-aquib/)
- Max397574
    - [Github](https://github.com/max397574/)
    - [Reddit](https://www.reddit.com/u/m397574)
