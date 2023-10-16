return {
    {
        'tpope/vim-fugitive',
        enabled = not in_vscode,
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
}
