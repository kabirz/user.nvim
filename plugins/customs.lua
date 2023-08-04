return {
  {
    "oberblastmeister/zoom.nvim",
    keys = { { "<localleader>m", "<cmd> Zoom <cr>", desc = "zoom toggle" } },
  },
  {
    "rqdmap/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<localleader>s", "<cmd> SymbolsOutline <cr>", desc = "toggle symbol outline" } },
    opts = require("user.configs.symbols_outline"),
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    keys = { { "<localleader>e", "<cmd> Telescope symbols <cr>", desc = "Emoji input" } },
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
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "jose-elias-alvarez/null-ls.nvim" },
    opts = require("user.configs.others").mason_config,
  },
  {
    "NvChad/nvterm",
    keys = {
      { ";i", function() require("nvterm.terminal").toggle("float") end,
        mode = { "n", "t" }, desc = "Toggle floating term",
      },
      { ";h", function() require("nvterm.terminal").toggle("horizontal") end,
        mode = { "n", "t" }, desc = "Toggle horizontal term",
      },
      { ";v", function() require("nvterm.terminal").toggle("vertical") end,
        mode = { "n", "t" }, desc = "Toggle vertical term",
      },
    },
    config = function() require("nvterm").setup() end,
  },
}
