local textChangeAu = function()
	vim.api.nvim_exec([[au TextChanged * lua vim.cmd('w') require('themer.reload.load')()]], true)
	vim.api.nvim_exec([[au InsertLeave * lua vim.cmd('w') require('themer.reload.load')()]], true)
end

return textChangeAu
