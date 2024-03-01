return {
    { 'neovim/nvim-lspconfig',    enabled = not in_vscode },
    { 'hrsh7th/cmp-nvim-lsp',     enabled = not in_vscode },
    { 'hrsh7th/cmp-buffer',       enabled = not in_vscode },
    { 'hrsh7th/cmp-path',         enabled = not in_vscode },
    { 'hrsh7th/cmp-cmdline',      enabled = not in_vscode },
    { 'hrsh7th/nvim-cmp',         enabled = not in_vscode },
    { 'L3MON4D3/LuaSnip',         enabled = not in_vscode },
    { 'saadparwaiz1/cmp_luasnip', enabled = not in_vscode },
    { 'onsails/lspkind.nvim',     enabled = not in_vscode },
    { "simrat39/rust-tools.nvim", enabled = not in_vscode },
    { "mfussenegger/nvim-dap",    enabled = not in_vscode },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        enabled = not in_vscode
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        enabled = not in_vscode,
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.preset("recommended")

            lsp.ensure_installed({
                -- "tsserver",
                -- "eslint",
                "lua_ls",
                -- "rust_analyzer"
            })

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)

                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()

            local cmp = require('cmp')
            local cmp_action = lsp.cmp_action()

            local lspkind = require('lspkind')

            -- gray
            vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
            -- blue
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
            -- light blue
            vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
            vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
            vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
            -- pink
            vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
            vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
            -- front
            vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
            vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
            vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })


            local luasnip = require("luasnip")

            vim.opt.completeopt = "menu,menuone,noselect"

            local has_words_before = function()
                print(vim.api.nvim_win_get_cursor(0));
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            vim.diagnostic.config({ update_in_insert = true })

            cmp.setup({
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                window = {
                    completion = {
                        --border = "rounded",
                    },
                    documentation = {
                        --border = "rounded",
                    },
                },
                formatting = {
                    --formats
                    --@param entry cmp.Entry
                    --@param vim_item vim.CompletedItem
                    format = function(entry, vim_item)
                        if vim.tbl_contains({ 'path' }, entry.source.name) then
                            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item()
                                .label)
                            if icon then
                                vim_item.kind = icon
                                vim_item.kind_hl_group = hl_group


                                print(entry)

                                return vim_item
                            end
                        end
                        return lspkind.cmp_format({ with_text = true })(entry, vim_item)
                    end
                }
            })
        end
    },

}
