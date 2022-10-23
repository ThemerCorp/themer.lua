vim.cmd([[command! -nargs=0 ThemerReload :lua require("themer.modules.reload").load_au() ]])
vim.cmd([[command! -nargs=0 ThemerImport :lua require("themer.modules.import").write_colorscheme() ]])
