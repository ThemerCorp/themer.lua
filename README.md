# themer.lua

A simple fast highlight plugin and colorscheme creator for neovim, written in lua.

## 🌟 Features
- attempt to fix the chaotic colorscheme ecosystem of neovim with every colorscheme it's own way of configuring and other stuff
- lots of supported colorschemes (will be done soon! 😃)
- uses the `vim.api.nvim_set_hl()` instead of `vim.cmd[[]]` calls 🥳
- using this plugin you will get a pure 100% lua experience, even without any extra taxes 🤣
- supports most of the plugins (if it doesn't, you can open an issue 🐞 or make a pull)

## 🔧 Installation
Make sure to use Neovim version 0.5.x or higher (I use Neovim version 0.6+ so if things do not work on v0.5.x, feel free to open an issue 🐛)

- [Packer](https://github.com/wbthomason/packer.nvim)
```lua
use({
	"narutoxy/themer.lua",
	branch = "dev",	-- I recommend dev branch because it has more plugin support currently
	module = "themer",	-- load it as fast as possible
	config = function()
		-- vim.cmd("colorscheme dark_cpt") -- you can also do this
		require("themer").load("dark_cpt")
	end,
})
```
Resource the current file, and run `:PackerInstall` to install the plugin.

- [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'NarutoXY/themer.lua', { 'branch': 'dev' } "dev branch has more plugin support
```
Resource the current file, and run `:PlugInstall` to install the plugin.

Now you can place this base configuration in your `init.vim` file:
```vim
lua << EOF
	require("themer").load("dark_cpt")
EOF
```

or you can also place this in your `init.vim` file:
```vim
colorscheme dark_cpt 
```

PS: Be sure to replace dark\_cpt with your favourite colorscheme :P

## 🧰 Configuration
`themer.lua` provides tons of ways to customise it

1. `themer.lua` uses a config table for configuration

Here are the defaults:
```lua
config.options = {
    colorscheme = "rose_pine", -- default colorscheme
    transparency = false,
	term_colors = true,
	styles = {
		comments = { italic = true },
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		parameters = {},
		fields = {},
	},
	colors = {
	--		hint = nil,
	--		info = nil,
	--		warn = nil,
	--		error = nil,
	--		punctuation = nil,
	--		comment = nil,
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				error = { italic = true },
				hint = { italic = true },
				warn = { italic = true },
				info = { italic = true },
			},
			underlines = {
				error = { underline = true },
				hint = { underline = true },
				warn = { underline = true },
				info = { underline = true },
			},
		},
		cmp = true,
		gitsigns = true,
		telescope = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		barbar = true,
		bufferline = true,
		markdown = true,
	},
	extra_integrations = {
		galaxyline = true,
		lualine = true,
	},
}
```

The way you setup the settings varies on the config language you use
- lua
```lua
require("themer").setup({}) -- your options go inside {}
```

- vimL
```vim
lua << EOF
	require("themer").setup({}) -- your options go inside {}
EOF
```

2. You can also remap default highlights and color values
```lua
-- remapping colorschemes
require("themer").remap_colorscheme({})

-- remapping highlights
require("themer").remap_hl_group({})
```

### 🖌️ Using your custom color pallete

You can also just pass on your color pallete to themer and themer will use it to apply highlights

```lua
-- useful aliases
local utils = require("themer.utils.util")
local config = require("themer.config").options

vim.g.colors_name = "foo"	-- your colorscheme name

-- your colorscheme pallete

-- See https://github.com/NarutoXY/themer.lua#adding-a-new-colorscheme
local pallete = {
    flavour = "light",
    bg = "#faf4ed",
    bg_alt = "#fffaf3",
    bg_float = "#f2e9de",
    inactive = "#9893a5",
    subtle = "#6e6a86",
    fg = "#575279",
    red = "#b4637a",
    yellow = "#ea9d34",
    orange = "#d7827e",
    blue = "#286983",
    green = "#56949f",
    magenta = "#907aa9",
    highlight = "#eee9e6",
    highlight_inactive = "#f2ede9",
    highlight_overlay = "#e4dfde",
}

local theme = require("themer.core.mapper").apply(pallete)

-- Sadly extra integrations dont match with custom pallete. Support coming soon 🚀
utils.load(theme)
```
## 🤖 Useful APIs
Some useful APIs for other developers or for advanced configuration

- Getting the colorscheme by passing the theme name
```lua
require("themer.api.colors").get_color_scheme(<color_scheme>)
```

- Setting highlights on basis of provided color values in a lua table
```lua
require("themer.core.mapper").apply({})
```

- Blending two colors
```lua
require("themer.utils.util").blend(fg, bg, alpha)
```

- Darkening a given color
```lua
require("themer.utils.util").darken(hex, amount, bg) -- if `bg` not provided then "#000000" will be used
```

- Lightening given color
```lua
require("themer.utils.util").lighten(hex, amount, fg) -- "#ffffff" will be used as fallback for fg
```

- Converting given hex value to rgb
```lua
require("themer.utils.util").hex2rgb(hex)
```

### JSON APIs
All JSON utils are in `./lua/themer/utils/json.lua`. Here's a quick look on all the utils
```lua
local j = require("themer.utils.json")

local version = j.is_minimum_version(0, 6, 0) -- true if neovim version is 0.6.0+

local cfd = j.get_cfd() 					  -- returns absolute path of `./lua/themer/utils/json.lua`

local codec = j.encode_decode()				  -- returns a table
-- codec.encode will be using vim.json.encode or vim.fn.json_encode depending on the nvim version
-- codec.decode will be using vim.json.decode or vim.fn.json_decode depending on the nvim version

local decode = j.decode('../color_schemes/json/foo.json')
-- parses the json content of given file using codec.decode and returns a lua table
-- path of json file should be relative to `./lua/themer/utils/json.lua`
-- see `./lua/themer/color_schemes/papa_dark.lua` for working example
```

## 🍰 Supported Plugins
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

## 🌹 Supported colorschemes

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


## Contributing

### Adding a new colorscheme
Let's say we have to create a new colorsheme `foo`. Here is a brief guide on how to achieve that:
1. ```touch ./lua/themer/color_schemes/foo.lua```
2. ```nvim ./lua/themer/color_schemes/foo.lua```
3. Now comes the fun part of adding colors in the play. Here is a basic template for the color pallete

```lua
local colors = {
	flavour = "dark", -- set type of colorscheme: dark/light
	bg = "", -- background
	bg_alt = "", -- alternate background
	bg_float = "", -- for floating windows and statuslines and pum sidebar and pum selected and CursorColumn
	inactive = "", -- for stuff like empty folder(any inactive stuff)
	subtle = "", -- for comments and float border and more...
	fg = "", -- the foreground/text color
	red = "", -- for errors
	yellow = "", -- for warns
	orange = "", -- mostly for booleans
	blue = "", -- for keywords
	green = "", -- for info and constructors/labels and diffadd
	magenta = "", -- for hints and visual mode/search foreground/special comments/git stage and merge
	highlight = "", -- ofc for highlighting (it is the bg of highlighted text)
	highlight_inactive = "", -- same as highlight for inactive stuff and also cursor line
	highlight_overlay = "", -- same as highlight for overlays (floats)
	none = "NONE",
}

return colors
```
You can also take a look at `./lua/themer/color_schemes/papa_dark.lua` to remap highlights and also use json for the color pallete. (Yes you read it right, `themer.lua` also supports `.json` 😎)

4. ```echo "require('themer').load('foo')" >> ./colors/foo.lua # adding support for :colorscheme```

5. And you are done, just open neovim and do `:colorscheme foo` to test your latest colorscheme. Don't forget to open a new pr and contribute this to upstream.

### Fixing and adding new highlights
Yea so all highlights are in `./lua/themer/core/mapper.lua` and all the highlights for plugin integration are in `./lua/themer/core/integrations/`.

To add support for a new plugin `foo`, add highlights in `./lua/themer/core/integrations/foo.lua` like
```lua
local foo = {}

foo.get = function(cp)
	local hi = {
		Foo = { fg = cp.magenta },
	}
	return hi
end

return foo
```

and also add the config option in `./lua/themer/config.lua`
