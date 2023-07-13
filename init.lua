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
    -- language
	  { import = "astrocommunity.pack.bash" },
	  { import = "astrocommunity.pack.cmake" },
	  { import = "astrocommunity.pack.markdown" },
	  { import = "astrocommunity.pack.lua" },
	  { import = "astrocommunity.pack.rust" },
	  { import = "astrocommunity.pack.toml" },
	  { import = "astrocommunity.pack.yaml" },
		{
			"folke/flash.nvim",
			opts = { modes = { char = { enabled = false } } }
		},
	},
	colorscheme = "dracula",
	lsp = {
		formatting = { format_on_save = { enabled = false } },
		servers = {
			-- "ccls",
			"clangd",
			"bitbake",
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
