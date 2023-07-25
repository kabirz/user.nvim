local utils = require("user.utils")
local M = {}

M.mason_config = function(_, opts)
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
end

M.neorg_opts = {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.keybinds"] = {}, -- Adds default keybindings
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
  },
}

return M
