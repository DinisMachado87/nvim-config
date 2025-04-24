return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/playground" },
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				custom_captures = {
					["@variable"] = "Identifier",
				},
			},
			indent = { enable = true },
			playground = {
				enable = true,
				updatetime = 25,
				persist_queries = false,
			},
		})
		-- Custom highlight settings
		--
		-- Customize color for struct name
		-- vim.api.nvim_set_hl(0, "@variable", { fg = "#ffb86c" }) --orange
		vim.api.nvim_set_hl(0, "@variable", { fg = "#00b34d" }) --green
		-- vim.api.nvim_set_hl(0, "@variable", { fg = "#1a8cff" }) --blue
	end,
}
