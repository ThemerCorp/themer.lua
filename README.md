# themer.lua

A simple fast highlight plugin and colorscheme creator for neovim, written in lua.

## 🌟 Fetures
- chaotic colorscheme ecosystem of neovim with every colorscheme it's own way of configuring and other stuff
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
	after = "packer.nvim",
	config = function()
		-- vim.cmd("colorscheme dark_cpt") -- you can also do this
		require("themer").load("dark_cpt")
	end,
})
```
Resource the current file, and run `:PackerInstall` to install the plugin.

 [vim-plug](https://github.com/junegunn/vim-plug)
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

1. `themer.lua` uses `lua/themer/config.lua` for configuration

Here are the defaults:
```lua
    colorscheme = "dark_cpt", -- default colorscheme
    transparency = false,
	term_colors = true,
	styles = {
		comments = { italic = true },
		functions = { italic = true },
		keywords = { italic = true },
		strings = {},
		variables = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { italic = true },
				hints = { italic = true },
				warnings = { italic = true },
				information = { italic = true },
			},
			underlines = {
				errors = { underline = true },
				hints = { underline = true },
				warnings = { underline = true },
				information = { underline = true },
			},
		},
		cmp = false,
		telescope = false,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
		barbar = false,
		bufferline = false,
		markdown = false,
	},
	galaxyline = false, -- extra integrations
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

## 🍰 Supported Plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP diagnostics](https://neovim.io/doc/user/lsp.html)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Galaxyline.nvim](https://github.com/Ntbbloodbath/galaxyline.nvim)
- [BufferLine.nvim](https://github.com/akinsho/bufferline.nvim)

## 🌹 Supported colorschemes

|				   | Colorschemes     | Code Names         |
| ---------------- | ---------------- | ------------------ |
| ✅			   | Dark Catppuccino | `dark_catppuccino` |
| ✅               | Rose Pine        | `rose_pine`        |
| ✅               | Dracula          | `dracula`          |

