local wk = require("which-key")

vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<Leader>ff', 'ggVG=<C-o>', { noremap = true })



wk.add({

	{ mode = "n" },
	{ '<Leader>pv', function()
		require("telescope").extensions.file_browser.file_browser()
	end, {} }
})

--#region tabs
vim.keymap.set("n", "<S-E>",
	function()
		print("test")
	end)
--#endregion
