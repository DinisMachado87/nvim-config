return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({})
			-- Show documentation
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- Jump to definition (header)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- Jump to declaration
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
			-- code actions (corrections and modifications)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- show function signature and it's arguments
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				hint_enable = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},
}
