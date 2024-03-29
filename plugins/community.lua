return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  { "Bekaboo/dropbar.nvim", enabled = vim.fn.has("nvim-0.10.0") == 1 },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { "folke/flash.nvim", opts = { modes = { char = { enabled = false } } } },
  { import = "astrocommunity.project.project-nvim" },
  {
    "jay-babu/project.nvim",
    name = "project_nvim",
    opts = { manual_mode = true },
    keys = {{ "<localleader>p", "<cmd> Telescope projects <cr>", desc = "Telescope Project" }},
  },
  -- language
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.rust" },
  { "simrat39/rust-tools.nvim", opts = { tools = { inlay_hints = { auto = false } } } },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.python-ruff" },
}
