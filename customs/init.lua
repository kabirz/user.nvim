local utils = require("user.utils")
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
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "jose-elias-alvarez/null-ls.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")
      local nf = null_ls.builtins.formatting
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clang-format")
      opts.handlers = {
        clang_format = function()
          null_ls.register(nf.clang_format.with({
            extra_args = {
              "--style=file:" .. vim.fn.stdpath("config") .. "/lua/user/.clang-format",
            },
          }))
        end,
      }
    end,
  },
}
