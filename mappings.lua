local maps = {}
local utils = require("user.utils")
local is_available = utils.is_available

maps.n = {
  ["<localleader>k"] = { "<cmd> Man <cr>", desc = "Goto manual" },
  ["<localleader>h"] = { "<cmd> hide <cr>", desc = "hide current buffer" },
  ["<localleader>o"] = { "<cmd> only <cr>", desc = "close others buffer" },
  -- line numbers
  ["<localleader>n"] = { "<cmd> set nu! <CR>", desc = "Toggle line number" },
  ["<localleader>r"] = { "<cmd> set rnu! <CR>", desc = "Toggle relative number" },

  ["<localleader>c"] = {
    "<cmd> edit " .. vim.fn.stdpath("config") .. "/lua/user/init.lua <cr>",
    desc = "open user config",
  },
  ["<localleader>d"] = {
    function() vim.fn.chdir(vim.fn.expand("%:p:h")) end,
    desc = "change current directory",
  },
}

if is_available("neo-tree.nvim") then
  maps.n["<leader>a"] = {
    function() vim.cmd(string.format("Neotree toggle %s", vim.fn.expand("%:p:h"))) end,
    desc = "Toggle current file neotree",
  }
end

if is_available("toggleterm.nvim") then
  if vim.fn.executable("joshuto") == 1 then
    maps.n["<localleader>a"] = { utils.joshuto, desc = "ToggleTerm joshuto" }
    maps.n["<leader>ta"] = maps.n["<localleader>a"]
  end
  if vim.fn.executable("gitui") == 1 then
    maps.n["<localleader>g"] = {
      function() utils.toggle_term_cmd("gitui -d " .. vim.fn.expand("%:p:h")) end,
      desc = "ToggleTerm gitui",
    }
    maps.n["<leader>tg"] = maps.n["<localleader>g"]
  end
  local ipython = vim.fn.executable("ipython3") == 1 and "ipython3" or vim.fn.executable("ipython") == 1 and "ipython"
  if ipython then
    maps.n["<localleader>i"] = {
      function() utils.toggle_term_cmd(ipython) end,
      desc = "ToggleTerm ipython",
    }
    maps.n["<leader>ti"] = maps.n["<localleader>i"]
  end
end

maps.i = {}
if is_available("codeium.vim") then
  maps.i["<C-]>"] = {
    function() return vim.fn["codeium#Accept"]() end,
    expr = true,
    desc = "Codeium Accept",
  }
end

return maps
