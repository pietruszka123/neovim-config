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


-- require("lazy").setup(
-- 	{
-- 		{
-- 			'nvim-telescope/telescope.nvim',
-- 			tag = '0.1.1',
-- 			dependencies = { 'nvim-lua/plenary.nvim' },
-- 			enabled = not in_vscode
-- 		},
-- 		{
-- 			"nvim-telescope/telescope-file-browser.nvim",
-- 			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
-- 			enabled = not in_vscode
-- 		},
-- 		{ "nvim-lua/plenary.nvim",           enabled = not in_vscode },
-- 		{ 'marko-cerovac/material.nvim',     priority = 90000,       enabled = not in_vscode },
-- 		{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate",    enabled = not in_vscode },
-- 		{ 'ThePrimeagen/harpoon',            enabled = not in_vscode },
-- 		{ 'mbbill/undotree',                 enabled = not in_vscode },
-- 		{ 'tpope/vim-fugitive',              enabled = not in_vscode },
-- 		{
-- 			'VonHeikemen/lsp-zero.nvim',
-- 			enabled = not in_vscode,
-- 			branch = 'v2.x',
-- 			dependencies = {
-- 				-- LSP Support
-- 				{ 'neovim/nvim-lspconfig' }, -- Required
-- 				{                -- Optional
-- 					'williamboman/mason.nvim',
-- 					build = function()
-- 						pcall(vim.cmd, 'MasonUpdate')
-- 					end,
-- 				},
-- 				{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

-- 				-- Autocompletion
-- 				{ 'hrsh7th/nvim-cmp' }, -- Required
-- 				{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
-- 				{ 'L3MON4D3/LuaSnip' }, -- Required
-- 			}
-- 		},
-- 		{
-- 			'nvim-lualine/lualine.nvim',
-- 			dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
-- 			enabled = not in_vscode
-- 		},
-- 		{ 'prettier/vim-prettier',      build = "pnpm install", enabled = not in_vscode },
-- 		{
-- 			'windwp/nvim-autopairs',
-- 			event = "InsertEnter",
-- 			opts = {}, -- this is equalent to setup({}) function
-- 			enabled = not in_vscode
-- 		},
-- 		{ "rust-lang/rust.vim",         enabled = not in_vscode },
-- 		{ 'arkav/lualine-lsp-progress', enabled = not in_vscode },
-- 		{
-- 			'numToStr/Comment.nvim',
-- 			config = function()
-- 				require('Comment').setup()
-- 			end,
-- 			enabled = not in_vscode
-- 		},
-- 		{
-- 			"rebelot/heirline.nvim", enabled = not in_vscode
-- 		}, {
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		branch = "v2.x",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 			"MunifTanjim/nui.nvim",
-- 		},
-- 		enabled = not in_vscode
-- 	},
-- 		{
-- 			'akinsho/toggleterm.nvim',
-- 			version = "*",
-- 			config = true,
-- 			enabled = not
-- 				in_vscode
-- 		},
-- 		{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }, enabled = not in_vscode },
-- 		{
-- 			"https://git.sr.ht/~whynothugo/lsp_lines.nvim", enabled = not in_vscode
-- 		},
-- 		{
-- 			'akinsho/bufferline.nvim',
-- 			version = "*",
-- 			dependencies = 'nvim-tree/nvim-web-devicons',
-- 			enabled = not
-- 				in_vscode
-- 		},
-- 		{ "HiPhish/nvim-ts-rainbow2",        enabled = not in_vscode },
-- 		{ 'neovim/nvim-lspconfig',           enabled = not in_vscode },
-- 		{ 'hrsh7th/cmp-nvim-lsp',            enabled = not in_vscode },
-- 		{ 'hrsh7th/cmp-buffer',              enabled = not in_vscode },
-- 		{ 'hrsh7th/cmp-path',                enabled = not in_vscode },
-- 		{ 'hrsh7th/cmp-cmdline',             enabled = not in_vscode },
-- 		{ 'hrsh7th/nvim-cmp',                enabled = not in_vscode },
-- 		{ 'L3MON4D3/LuaSnip',                enabled = not in_vscode },
-- 		{ 'saadparwaiz1/cmp_luasnip',        enabled = not in_vscode },
-- 		{ 'onsails/lspkind.nvim',            enabled = not in_vscode },
-- 		{ "simrat39/rust-tools.nvim",        enabled = not in_vscode },
-- 		{ "mfussenegger/nvim-dap",           enabled = not in_vscode },
-- 		{ "junegunn/fzf",                    enabled = not in_vscode },
-- 		{ "junegunn/fzf.vim",                enabled = not in_vscode },
-- 		{
-- 			"folke/todo-comments.nvim",
-- 			dependencies = { "nvim-lua/plenary.nvim" },
-- 			opts = {
-- 				-- your configuration comes here
-- 				-- or leave it empty to use the default settings
-- 				-- refer to the configuration section below
-- 			},
-- 			enabled = not in_vscode
-- 		},

-- 		{
-- 			"bluz71/vim-moonfly-colors",
-- 			name = "moonfly",
-- 			lazy = false,
-- 			priority = 1000,
-- 			enabled = not
-- 				in_vscode
-- 		},
-- 		{
-- 			"folke/which-key.nvim",
-- 			event = "VeryLazy",
-- 			init = function()
-- 				vim.o.timeout = true
-- 				vim.o.timeoutlen = 300
-- 			end,
-- 			opts = {
-- 				-- your configuration comes here
-- 				-- or leave it empty to use the default settings
-- 				-- refer to the configuration section below
-- 			},
-- 			enabled = not in_vscode
-- 		},
-- 		{ import = "pietruszka123.plugins" },
-- 		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
-- 		-- { import = "lazyvim.plugins.extras.vscode" }
-- 		-- {
-- 		-- 	"LazyVim/LazyVim",
-- 		-- 	opts = {
-- 		-- 		colorscheme = ""
-- 		-- 	}
-- 		-- }
-- 	})
