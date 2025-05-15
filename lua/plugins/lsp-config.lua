return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = { 'lua_ls', 'ts_ls', 'clangd' },
				opts = { auto_install = true },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})

			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
