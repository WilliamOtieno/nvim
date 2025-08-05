return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = true,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		keys = {
			{ "<leader>pv", "<cmd>VenvSelect<cr>" },
			{ "<leader>pc", "<cmd>VenvSelectCached<cr>" },
		},
		---@type venv-selector.Config
		opts = {
			-- Your settings go here
		},
	},
}
