return {
    {
        'mbbill/undotree',
        enabled = not in_vscode,
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {})
        end
    },
}
