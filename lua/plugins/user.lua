return {
  {
    "oberblastmeister/zoom.nvim",
    keys = { { "<localleader>m", "<cmd> Zoom <cr>", desc = "zoom toggle" } },
  },
  {
    "rqdmap/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<localleader>s", "<cmd> SymbolsOutline <cr>", desc = "toggle symbol outline" } },
    opts = require "configs.symbols_outline",
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    keys = { { "<localleader>e", "<cmd> Telescope symbols <cr>", desc = "Emoji input" } },
  },
  {
    "NvChad/nvterm",
    keys = {
      {
        ";i",
        function() require("nvterm.terminal").toggle "float" end,
        mode = { "n", "t" },
        desc = "Toggle floating term",
      },
      {
        ";h",
        function() require("nvterm.terminal").toggle "horizontal" end,
        mode = { "n", "t" },
        desc = "Toggle horizontal term",
      },
      {
        ";v",
        function() require("nvterm.terminal").toggle "vertical" end,
        mode = { "n", "t" },
        desc = "Toggle vertical term",
      },
    },
    config = function() require("nvterm").setup() end,
  },
  -- 打开文件时 neo-tree 不自动跟随/收起目录/跳动；空格+a 仍会切根到当前文件目录
  -- bind_to_cwd=false: project.nvim 在 BufEnter 时自动 chdir 不再把树根拽到项目根
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
        bind_to_cwd = false,
      },
    },
  },
}
