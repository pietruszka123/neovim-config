if vim.g.vscode then
	return
end
if vim.fn[":GuiFont"] then
	vim.opt.guifont = { "Consolas Nerd Font:h14" }
end
