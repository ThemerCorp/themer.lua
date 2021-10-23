### WIP (READY FOR ALPHA USAGE)

## INTRODUCTION

A simple fast highlight plugin for neovim, written in lua.

### FEATURES
- Fast (as it is written completely in lua)
- Easy to use (as simple as doing `:colorscheme <fav colorscheme>`)
- Integrates with many plugins (thanks to the integration with `:colorscheme`)


### INSTALLATION

Using packer

```lua
use({
	"narutoxy/themer.lua",
	after = "packer.nvim",
	config = function()
		-- vim.cmd("colorscheme dark_cpt")
		require("themer").load("dark_cpt")
	end,
})
```

### SUPPORTED PLUGINS

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
<!--- [LSP diagnostics](https://neovim.io/doc/user/lsp.html)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Modes](https://github.com/mvllow/modes.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/folke/which-key.nvim)-->
- [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
<!--- [Neogit](https://github.com/TimUntersberger/neogit)-->

## CONTRIBUTION

### ADDING A NEW COLOR SCHEME

WIP README (It will be great if you can help in well documenting this plugin)
