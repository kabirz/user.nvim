return {
	plugins = {
		"AstroNvim/astrocommunity",
		{ import = "astrocommunity.colorscheme.dracula-nvim" },
		{ import = "astrocommunity.completion.codeium-vim" },
		-- { import = "astrocommunity.motion.flash-nvim" },
		{ import = "astrocommunity.bars-and-lines.dropbar-nvim" },
		{ import = "astrocommunity.utility.noice-nvim" },
		{
			"oberblastmeister/zoom.nvim",
			keys = { { ";m", "<cmd> Zoom <cr>", desc = "zoom toggle" } },
		},
		{
			"rqdmap/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			keys = { { ";o", "<cmd> SymbolsOutline <cr>", desc = "toggle symbol outline" } },
			opts = require("user.configs.symbols_outline"),
		},
		{
			"theniceboy/joshuto.nvim",
			keys = { { ";a", "<cmd> Joshuto <cr>", desc = "Joshuto" } },
		},
		{
			"aspeddro/gitui.nvim",
			keys = { { ";g", "<cmd> Gitui <cr>", desc = "gitui" } },
			opts = { command = { enable = true } },
		},
		{
			"nvim-telescope/telescope-symbols.nvim",
			keys = { { ",d", "<cmd> Telescope symbols <cr>", desc = "Emoji input" } },
		},
		{
			"gbprod/yanky.nvim",
			dependencies = "kkharji/sqlite.lua",
			opts = { ring = { storage = "sqlite" } },
			keys = {
				{ "<leader>y", "<cmd> Telescope yank_history <cr>", desc = "Open Yank History" },
			},
			config = function(_, opts)
				require("yanky").setup(opts)
				require("telescope").load_extension("yank_history")
			end,
		},
	},
	colorscheme = "dracula",
	lsp = {
		formatting = { format_on_save = { enabled = false } },
		servers = {
			"bashls",
			"pylsp",
			"ccls",
			-- "clangd",
			"neocmake",
			"rust_analyzer",
			"html",
			"yamlls",
			"bitbake",
			"swift_mesonls",
		},
		config = {
			bitbake = function()
				return {
					cmd = { "bitbake-language-server" },
					filetypes = { "bitbake" },
					root_dir = function(fname)
						return require("lspconfig.util").find_git_ancestor(fname)
					end,
				}
			end,
		},
	},
}
