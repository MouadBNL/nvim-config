return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = { "lua_ls", "ts_ls", "clangd", "volar" },
				opts = { auto_install = true },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- local mason_registry = require("mason-registry")
			-- local vuelsp = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							vim.env.VIMRUNTIME .. "/lua",
							-- Add other paths here if needed for specific plugins or libraries
							-- "${3rd}/luv/library",
							-- "${3rd}/busted/library",
						},
					},
					telemetry = {
						enable = false,
					},
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/home/owhut/.nvm/versions/node/v23.10.0/lib/node_modules/@vue/typescript-plugin",
							languages = { "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
			})

			lspconfig.volar.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				init_options = {
					typescript = {
						tsdk = "/home/owhut/.nvm/versions/node/v23.10.0/lib/node_modules/typescript/lib",
					},
				},
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
