return {
	plugins = {
		"AstroNvim/astrocommunity",
		{ import = "astrocommunity.colorscheme.dracula-nvim" },
		{ import = "astrocommunity.completion.codeium-vim" },
		{ import = "astrocommunity.bars-and-lines.bufferline-nvim" },
		{ import = "astrocommunity.bars-and-lines.dropbar-nvim" },
		{ import = "astrocommunity.utility.noice-nvim" },
		{ import = "astrocommunity.motion.flash-nvim" },
		{ import = "astrocommunity.code-runner.executor-nvim" },
		{ import = "astrocommunity.note-taking.neorg" },
		{ import = "user.customs"},
		{
			"folke/flash.nvim",
			opts = { modes = { char = { enabled = false } } }
		},
	},
	colorscheme = "dracula",
	lsp = {
		formatting = { format_on_save = { enabled = false } },
		servers = {
			"bashls",
			"pylsp",
			-- "ccls",
			"clangd",
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
