return { {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    enabled = not in_vscode,
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({})
    end
} }
