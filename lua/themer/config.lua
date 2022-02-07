local options = {
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
    --     rose_pine = {
    --     	base = {
    --     	  Normal = { bg = "#000000" }
    --      },
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
}

--- internal: iterate given options over the default config (for internal purposes)
--- user: iterate given options over the default config and loads the colorscheme
--- get: returns the options
--- @param type string
--- @param opts table
return function(type, opts)
  if type == "get" then
    return options
  elseif type == "internal" then
    options = vim.tbl_deep_extend("force", options, opts or {})
  elseif type == "user" then
    options = vim.tbl_deep_extend("force", options, opts or {})
    if options.colorscheme then
      require("themer.modules.core")(options.colorscheme)
    end
    -- Load installed themes
    if options.enable_installer then
      if require("themer.utils.fs").exists(vim.fn.stdpath("data") .. "/themer") ~= true then
        os.execute("mkdir " .. vim.fn.stdpath("data") .. "/themer")
      end
      vim.cmd([[command! -nargs=0 ThemerInstall :lua require("themer.modules.installer").fuzzy_install()]])
      vim.cmd([[command! -nargs=0 ThemerUnInstall :lua require("themer.modules.installer").fuzzy_uninstall()]])
      require("themer.modules.installer.load_installed").load_installed_themes()
    end
  end
end
