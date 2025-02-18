local wk = require("which-key")

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'


vim.lsp.inlay_hint.enable(true)


-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		wk.add({
			{ mode = "n" },
			{ 'K',       '<cmd>lua vim.lsp.buf.hover()<cr>',           opts },
			{ 'gd',      '<cmd>lua vim.lsp.buf.definition()<cr>',      opts },
			{ 'gD',      '<cmd>lua vim.lsp.buf.declaration()<cr>',     opts },
			{ 'gi',      '<cmd>lua vim.lsp.buf.implementation()<cr>',  opts },
			{ 'go',      '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts },
			{ 'gr',      '<cmd>lua vim.lsp.buf.references()<cr>',      opts },
			{ 'gs',      '<cmd>lua vim.lsp.buf.signature_help()<cr>',  opts },
			{ '<F2>',    '<cmd>lua vim.lsp.buf.rename()<cr>',          opts },
			{ '<F4>',    '<cmd>lua vim.lsp.buf.code_action()<cr>',     opts },

		})
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	end,
})

-- Autocompletion
local cmp = require('cmp')

local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer',  keyword_length = 3 },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),

	}),
})

-- Language Servers
require('lspconfig').lua_ls.setup({})
require('lspconfig').nil_ls.setup({
	settings = {
		['nil'] = {
			formatting = {

				command = { "nixfmt" }
			}
		},
	}

})
require'lspconfig'.nixd.setup{}


require 'lspconfig'.gopls.setup({})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
	capabilities = capabilities,
}

require 'lspconfig'.biome.setup {}
require 'lspconfig'.hyprls.setup {}
require 'lspconfig'.rust_analyzer.setup {}


require("crates").setup {
	lsp = {
		enabled = true,
		on_attach = function(client, bufnr)
			-- the same on_attach function as for your other lsp's
		end,
		actions = true,
		completion = true,
		hover = true,
	}
}
