-- Zig development: zig-lamp bootstraps ZLS (the Zig language server) so you
-- don't need to manage it via Mason/lspconfig. It matches and installs the ZLS
-- build for your current Zig version, and falls back to a system `zls` if found.
--
-- Configured entirely through `vim.g.zig_lamp_*` globals (no setup() call).
-- Useful commands once installed:
--   :ZigLamp zls install   -- download/install a matching ZLS
--   :ZigLamp zls status    -- show managed ZLS versions
--   :ZigLamp health        -- diagnose the setup
--   :ZigLamp build / test  -- run `zig build` / `zig build test`
--   :ZigLamp pkg           -- package (build.zig.zon) helper UI
return {
	{
		"jinzhongjia/zig-lamp",
		event = "VeryLazy",
		build = ":ZigLampBuild async", -- compiles zig-lamp's native component (needs zig)
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		init = function()
			-- Auto-download/install a ZLS matching the project's Zig version.
			vim.g.zig_lamp_zls_auto_install = 1
			-- If no managed ZLS matches, fall back to a system-installed `zls`.
			vim.g.zig_lamp_fall_back_sys_zls = 1
			-- Extra LSP client options / ZLS server settings (left at defaults).
			vim.g.zig_lamp_zls_lsp_opt = {}
			vim.g.zig_lamp_zls_settings = {}
			-- Package-help UI accent color and metadata fetch timeout (ms).
			vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
			vim.g.zig_lamp_zig_fetch_timeout = 5000
		end,
	},
}
