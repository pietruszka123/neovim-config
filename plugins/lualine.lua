return {
    { 'arkav/lualine-lsp-progress', enabled = not in_vscode },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        enabled = not in_vscode,
        config = function()
            local lualine = require('lualine')
            lualine.setup({
                sections = {
                    lualine_c = {
                        'lsp_progress'
                    }
                }
            })
        end
    },
}
