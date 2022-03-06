--- Split strings
--- @param inputstr string string to split
--- @param sep string separator
local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

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

  -- time = {
  --   ["rose_pine"] = { "13-14", "15-16" }, -- syntax ["colorscheme"] = { "start-end", "start2-end2" },
  -- },
}

--- [[
--- internal: iterate given options over the default config (for internal purposes)
--- user: iterate given options over the default config and loads the colorscheme
--- get: returns the options
--- ]]
--- @param type string
--- @param opts table
local setup = function(type, opts)
  if type == "get" then
    return options
  elseif type == "internal" then
    options = vim.tbl_deep_extend("force", options, opts or {})
  elseif type == "user" then
    options = vim.tbl_deep_extend("force", options, opts or {})
    if not options.colorscheme and #options.time ~= 0 then
      local _hr = tostring(os.date("*t").hour)
      for cs, cond in pairs(options.time) do
        for _, current_cond in ipairs(cond) do
          local from_to = split(current_cond, "-")
          if _hr >= from_to[1] and _hr < from_to[2] then
            options.colorscheme = cs
          end
        end
      end
    end
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

return setup
