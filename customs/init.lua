return {
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
}
