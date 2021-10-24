### THIS IS JUST AN ARCHIVED VERSION OF MY OLD THEMER CONCEPT FOR THOSE LOOKING FOR A MINIMAL HIGHLIGHT PLUGIN

### MAINTAINED: NO
### ABANDONED: NO

## INTRODUCTION

A simple fast highlight plugin using base 16 colors for neovim, written in lua.

### FEATURES
- Fast (as it is written completely in lua)
- Small Codebase (just 351 lines of lua code)
- Easy to use (as simple as doing `:colorscheme <fav colorscheme>`)
- Using the standard base 16 colors
- Integrates with many plugins (thanks to the integration with `:colorscheme`)


### INSTALLATION

Using packer

```lua
use({
	"narutoxy/base-16.nvim",
	after = "packer.nvim",
	config = function()
		vim.cmd("colorscheme everforest")	-- ofc replace everforest with your fav colorscheme
	end,
})
```

### SUPPORTED PLUGINS

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP diagnostics](https://neovim.io/doc/user/lsp.html)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Modes](https://github.com/mvllow/modes.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Neogit](https://github.com/TimUntersberger/neogit)

## CONTRIBUTION

### ADDING A NEW COLORSCHEME

Example, you want to create `foo` colorscheme
Here is what to do
1. Create a file in `colors/foo.lua`
   The file content will look like
```lua
package.loaded['base-16'] = nil
package.loaded['base-16.functions'] = nil
package.loaded['base-16.theme'] = nil
package.loaded['base-16.util'] = nil

require("base-16").load("foo")
```
3. Then add the `theme_name` in the local `available_themes` table in `lua/base-16/loader.lua`.
4. Then put the colors in `lua/base-16/themes/foo.lua`. Refer to official docs of the colorscheme, they would probably have base 16 colors list available.
the file content should look something like
```lua
return {
	base00 = "#191724", -- ofc replace the color values with the color values of the colorscheme
	base01 = "#1f1d2e",
	base02 = "#26233a",
	base03 = "#555169",
	base04 = "#6e6a86",
	base05 = "#e0def4",
	base06 = "#f0f0f3",
	base07 = "#c5c3ce",
	base08 = "#e2e1e7",
	base09 = "#eb6f92",
	base0A = "#f6c177",
	base0B = "#ebbcba",
	base0C = "#31748f",
	base0D = "#9ccfd8",
	base0E = "#c4a7e7",
	base0F = "#e5e5e5",
}
```

and you are done, told ya it was very easy to do

### CREATING PR FOR HIGHLIGHTS
All highlights are in `lua/base-16/theme.lua`. You are welcome to refactor and add support for some more plugins 😄

## ROADMAP
- [x] Add support for galaxyline
- [ ] Add support for lualine
- [ ] Allow overriding defaults
- [ ] Live reload themes
- [ ] Export to a single file
