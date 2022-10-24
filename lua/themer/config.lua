local config = {}

config.options = {
  colorscheme = nil, -- default colorscheme
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
    --     rose_pine = function(cp) -- cp is the color palette
    --     	return { base = {
    --     	  Normal = { bg = cp.fg }
    --      },}
    --     end,
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
    nvim_tree = true,
  },

  -- Default telescope picker mappings
  telescope_mappings = {
    ["n"] = {
      ["<CR>"] = "enter",
      ["k"] = "prev_color",
      ["j"] = "next_color",
      ["p"] = "preview",
    },
    ["i"] = {
      ["<CR>"] = "enter",
      ["<S-Tab>"] = "prev_color",
      ["<Tab>"] = "next_color",
      ["<C-p>"] = "preview",
    },
  },

  enable_installer = false, -- toggle to enable installer

  time = { enable = false }, -- Time based colorscheme switch
  -- time = {
  --   ["rose_pine"] = { "13-14", "15-16" }, -- syntax ["colorscheme"] = { "start-end", "start2-end2" },
  -- Apply rose_pine from 1300 to 1400 hours and then from 1500 to 1600 hours, for rest of the day use the colorscheme in 'colorscheme' variable
  -- },
}

--- @param opts table
config.setup = function(opts)
  config.options = vim.tbl_deep_extend("force", config.options, opts or {})

  -- time module
  if config.options.time.enable then
    config.options.colorscheme = require("themer.modules.time")(config.options.colorscheme, config.options.time)
  end

  -- load colorscheme
  if config.options.colorscheme then
    require("themer.modules.core")(config.options.colorscheme)
  end

  -- Load installed themes
  if config.options.enable_installer then
    vim.defer_fn(function()
      require("themer.modules.installer.utils").load_installer()
    end, 10)
  end
end

return config
