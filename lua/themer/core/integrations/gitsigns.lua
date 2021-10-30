local gitsigns = {}

function gitsigns.get(cp)
    return {
        SignAdd = { fg = cp.green },
        SignChange = { fg = cp.orange },
        SignDelete = { fg = cp.red },
        GitSignsAdd = { fg = cp.green },
        GitSignsChange = { fg = cp.orange },
        GitSignsDelete = { fg = cp.red },
    }
end

return gitsigns
