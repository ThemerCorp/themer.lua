# INTRODUCTION

This is a base 16 nvim plugin uniformalizing colorschemes and highlights in neovim with a base 16 approch

# USAGE
```lua
use({
	"narutoxy/base-16.nvim",
	after = "packer.nvim",
	config = function()
		local base16 = require("base16")
		base16(base16.themes("rose-pine", true))
	end,
})

```
PS: This is using packer.nvim
