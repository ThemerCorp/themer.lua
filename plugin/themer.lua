vim.cmd [[command! -nargs=0 ThemerInstall :lua require("themer.modules.installer").fuzzy_install()]]
vim.cmd [[command! -nargs=0 ThemerUnInstall :lua require("themer.modules.installer").fuzzy_uninstall()]]
