return {
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        enabled = not in_vscode,
        config = function()
            require("lsp_lines").setup()

            -- Disable virtual_text since it's redundant due to lsp_lines.
            vim.diagnostic.config({
                virtual_text = false,
            })
        end
    },
}
