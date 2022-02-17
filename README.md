<div align="center">

<img src="./assets/themer.png" width=315>
<h1>THEMER - AN ORGANISED COLORSCHEME WORLD</h1>

<h5>Colorifying neovim editors since 2021</h5>

<h2> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- BADGES -->

<a href="https://github.com/neovim/neovim"> <img src="https://img.shields.io/badge/requires-neovim%200.6%2B-green?color=76946A&labelColor=16161D&style=for-the-badge&logo=neovim"> </a>
<a href="https://github.com/narutoxy/themer.lua/stargazers">
<img src="https://img.shields.io/github/stars/narutoxy/themer.lua?color=6A9589&labelColor=16161D&style=for-the-badge">
</a>
<a href="https://github.com/narutoxy/themer.lua/network/members/">
<img src="https://img.shields.io/github/forks/narutoxy/themer.lua?color=6A9589&labelColor=16161D&style=for-the-badge">
</a>
<img src="https://img.shields.io/github/repo-size/narutoxy/themer.lua?color=C34043&labelColor=16161D&style=for-the-badge">
<a href="https://discord.gg/M8tYvn5BAG">
<img src="https://img.shields.io/discord/916917730542764062?color=2D4F67&labelColor=16161D&style=for-the-badge"/>
</a>

</div>

[Credits: Logo by Binx](#green_heart-credits)

# README WIP

# 🔧 Installation

- [Packer](https://github.com/wbthomason/packer.nvim)

```lua
    use({
        "themercorp/themer.lua",
        config = function()
            require("themer").setup({
                colorscheme = "kanagawa",
                styles = {
			comment = { style = 'italic' },
                  	["function"] = { style = 'italic' },
                   	functionbuiltin = { style = 'italic' },
                   	variable = { style = 'italic' },
                    	variableBuiltIn = { style = 'italic' },
                  	parameter  = { style = 'italic' },
                },
            })
        end
    })
```

- [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'themercorp/themer.lua'
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
                    	variableBuiltIn = { style = 'italic' },
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

|     | Colorschemes   | Code Names       |
| --- | -------------- | ---------------- |
| ✅  | Catppuccin     | `catppuccin`     |
| ✅  | Rose Pine      | `rose_pine`      |
| ✅  | Rose Pine Moon | `rose_pine_moon` |
| ✅  | EverForest     | `everforest`     |
| ✅  | Doom One       | `doom_one`       |
| ✅  | Rose Pine Dawn | `rose_pine_dawn` |
| ✅  | Dracula        | `dracula`        |
| ✅  | Papa Dark      | `papa_dark`      |
| ✅  | One Dark       | `onedark`        |
| ✅  | Nord           | `nord`           |
| ✅  | Kurai          | `kurai`          |

This list may not be updated. See [`lua/themer/modules/themes`](https://github.com/ThemerCorp/themer.lua/tree/main/lua/themer/modules/themes)

# 🧰 Configuring Themer

Heres the default config table

```lua
{
    colorscheme = "rose_pine", -- default colorscheme
    transparent = false,
    term_colors = true,
    dim_inactive = false,
    disable_telescope_themes = {},
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
    enable_installer = false, -- enable installer module
}
```

# 🧸 Extra Goodies

## 🖱️ Scroll Colors

Scroll the colorschemes on the fly with `:SCROLLCOLOR` (Inspired by scroll-colors.vim)

## 🔭 Telescope Picker

You can use a telescope picker to preview the themes and load the colorschemes on the fly

To use the picker

```vim
lua require("telescope").load_extension("themes")
Telescope themes
```

## Reload

While developing your own colorscheme with themer, you can use the `reload` module to reload the colors on the fly.

To start the reload module `:ThemerReload` and start editing.
Whenever you leave Insert mode, themer will try to load the theme as per table returned by the current buffer lua file.

## Installer

You can use themer to install other themes which are yet to be ported to themer (or can just port them with import api to themer 😉)

To enable installer add this to your config

```lua
require("themer").setup({ enable_installer = true })
```

You can use `:ThemerInstall` to browse and install themes. (using telescope 🔭)
And can do `:ThemerUnInstall` to uninstall installed themes.

Themer will load installed themes along with setup.

## Exporting theme to other stuff

You can export current colorscheme to the following:

- XResources `:lua require("themer.modules.export.xres").write_config()`
- Kitty `:lua require("themer.modules.export.kitty").write_config()`
- Alacritty `:lua require("themer.modules.export.alacritty").write_config()`
- Compiled Neovim colorscheme `:lua require("themer.modules.export.nvim").write_colorscheme(require("themer.modules.themes.catppuccin"))` (PS: This one needs the color palette as the param)
- Compiled Vim colorscheme `:lua require("themer.modules.export.vim").write_colorscheme(require("themer.modules.themes.catppuccin"))` (PS: This one also needs the color palette as the param)

## Using API to access colors

You can use `colors` api to access color palette of given theme

```lua
require("themer.modules.core.api").get_cp("catppuccin")
```

# 🤝 Contributing

## Adding more plugin higs

All plugin highlight groups are in [`modules/core/mapper.lua`](https://github.com/ThemerCorp/themer.lua/blob/main/lua/themer/modules/core/mapper.lua)

Feel free to add new plugin hig groups in `availablePlugins` table and then tweaking `config.options.plugins` to add plugin to the list.

## Adding new colorscheme

Here's an example colorscheme with themer palette

```lua
-- Generated by Themer
return {
  ["cursorlinenr"] = "#ff9e3b",
  ["dimmed"] = { ["inactive"] = "#54546d", ["subtle"] = "#727169" },
  ["built_in"] = {
    ["function"] = "#7fb4ca",
    ["constant"] = "#7fb4ca",
    ["keyword"] = "#957fb8",
    ["variable"] = "#e46876",
    ["type"] = "#7aa89f",
  },
  ["gitsigns"] = { ["remove"] = "#c34043", ["add"] = "#76946a", ["change"] = "#dca561" },
  ["pum"] = {
    ["sbar"] = "#223249",
    ["sel"] = { ["fg"] = "#0", ["bg"] = "#2d4f67" },
    ["fg"] = "#dcd7ba",
    ["bg"] = "#223249",
    ["thumb"] = "#2d4f67",
  },
  ["heading"] = { ["h1"] = "#7e9cd8", ["h2"] = "#0" },
  ["uri"] = "#7fb4ca",
  ["inc_search"] = { ["fg"] = "#223249", ["bg"] = "#ff9e3b" },
  ["syntax"] = {
    ["tag"] = "#957fb8",
    ["constant"] = "#ffa066",
    ["preproc"] = "#ffa066",
    ["string"] = "#98bb6c",
    ["parameter"] = "#e6c384",
    ["field"] = "#e6c384",
    ["variable"] = "#0",
    ["number"] = "#d27e99",
    ["statement"] = "#957fb8",
    ["todo"] = { ["fg"] = "#658594", ["bg"] = "#223249" },
    ["function"] = "#7e9cd8",
    ["punctuation"] = "#9cabca",
    ["struct"] = "#7aa89f",
    ["operator"] = "#c0a36e",
    ["conditional"] = "#957fb8",
    ["type"] = "#7aa89f",
    ["comment"] = "#727169",
    ["keyword"] = "#957fb8",
    ["property"] = "#e6c384",
    ["constructor"] = "#957fb8",
    ["include"] = "#ffa066",
  },
  ["border"] = "#54546d",
  ["fg"] = "#dcd7ba",
  ["match"] = "#7e9cd8",
  ["diagnostic"] = { ["warn"] = "#ff9e3b", ["info"] = "#658594", ["error"] = "#e82424", ["hint"] = "#6a9589" },
  ["bg"] = { ["alt"] = "#16161d", ["selected"] = "#363646", ["base"] = "#1f1f28" },
  ["diff"] = { ["text"] = "#49443c", ["remove"] = "#43242b", ["add"] = "#2b3328", ["change"] = "#252535" },
  ["accent"] = "#7fb4ca",
  ["search_result"] = { ["fg"] = "#dcd7ba", ["bg"] = "#2d4f67", ["telescope"] = "#7fb4ca" },
}
```

Also add the theme name to `README` and add it to `colors/`

## Porting another vim/neovim theme

You can use `lua/themer/modules/import/init.lua` to generate color palette and port that theme to themer

```vim
colorscheme my_awesome_theme
lua require("themer.modules.import").write_colorscheme()
```

## Using themer to make your colorscheme plugin

You can use `lua/themer/modules/export/nvim.lua` and `lua/themer/modules/export/vim.lua` to create a single vim file (with no dependancy on themer) and can use that for creating your colorscheme plugin easily.
Also contribute theme palette to themer, if possible.

# :green_heart: Credits

Massive shoutouts to the people who supported the project! These are:

- Binx, for making that gorgeous logo for free!
  - [Github](https://github.com/Binx-Codes/)
  - [Reddit](https://www.reddit.com/u/binxatmachine)
- Papa Megamind
- TarunDaCoder
  - [Github](https://github.com/tarundacoder/)
  - [Reddit](https://www.reddit.com/u/tarundacodr)
- Gilfoyle
  - [Github](https://github.com/tamton-aquib/)
- Max397574
  - [Github](https://github.com/max397574/)
  - [Reddit](https://www.reddit.com/u/m397574)
  - Creators of all the themes, in themer.
  - NvChad community (some themes are ported from nvchad's base16 plugin)
  - All those who helped in porting the themes to themer
  - [GitHub](https://github.com/NvChad)
  - [Website](https://nvchad.github.io)
