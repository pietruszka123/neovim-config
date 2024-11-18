local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "


in_vscode = false
if vim.g.vscode then
	in_vscode = true
	-- 'nvim-telescope/telescope.nvim',
	-- 'VonHeikemen/lsp-zero.nvim',
	-- 'nvim-lualine/lualine.nvim',
	-- 'prettier/vim-prettier',
	-- 'windwp/nvim-autopairs',
	-- 'junegunn/fzf.vim',
end

require("lazy").setup("pietruszka123.plugins")
