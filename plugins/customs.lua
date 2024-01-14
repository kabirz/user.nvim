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
