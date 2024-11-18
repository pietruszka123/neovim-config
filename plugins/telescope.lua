return {
	{ "junegunn/fzf",     enabled = not in_vscode },
	{ "junegunn/fzf.vim", enabled = not in_vscode },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' },
		enabled = not in_vscode,
		opts = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', function()
				local res, _ = pcall(builtin.git_files)
				if res ~= true then
					builtin.find_files()
				end
			end, {}
			)
			vim.keymap.set('n', '<leader>ps', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, {})
		end,
	}, { "nvim-lua/plenary.nvim", enabled = not in_vscode }, }
