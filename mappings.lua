local maps = {}
local utils = require("user.utils")
local is_available = utils.is_available

maps.n = {
  ["bl"] = { "<cmd> bnext <cr>", desc = "Goto next buffer" },
  ["bh"] = { "<cmd> bprevious <cr>", desc = "Goto prev tab" },
  ["bf"] = { "<cmd> bfirst <cr>", desc = "Goto first tab" },
  ["be"] = { "<cmd> blast <cr>", desc = "Goto last tab" },
  ["bd"] = { "<cmd> bd <cr>", desc = "close current file" },
  ["tl"] = { "<cmd> tabnext <cr>", desc = "Goto next tab" },
  ["th"] = { "<cmd> tabprevious <cr>", desc = "Goto prev tab" },
  ["tf"] = { "<cmd> tabfirst <cr>", desc = "Goto first tab" },
  ["te"] = { "<cmd> tablast <cr>", desc = "Goto last tab" },
  ["td"] = { "<cmd> tabclose <cr>", desc = "close current tab" },
  ["gk"] = { "<cmd> Man <cr>", desc = "Goto manual" },
  [";h"] = { "<C-w>h", desc = "Window left" },
  [";l"] = { "<C-w>l", desc = "Window right" },
  [";j"] = { "<C-w>j", desc = "Window down" },
  [";k"] = { "<C-w>k", desc = "Window up" },
  [",h"] = { "<cmd> hide <cr>", desc = "hide current buffer" },
  [",o"] = { "<cmd> only <cr>", desc = "close others buffer" },
  -- line numbers
  [";n"] = { "<cmd> set nu! <CR>", desc = "Toggle line number" },
  [";r"] = { "<cmd> set rnu! <CR>", desc = "Toggle relative number" },

  [";c"] = {
    "<cmd> edit " .. vim.fn.stdpath("config") .. "/lua/user/init.lua <cr>",
    desc = "open user config",
  },
  [";d"] = {
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
    maps.n[";a"] = { utils.joshuto, desc = "ToggleTerm joshuto" }
    maps.n["<leader>ta"] = maps.n[";a"]
  end
  if vim.fn.executable("gitui") == 1 then
    maps.n[";g"] = {
      function() utils.toggle_term_cmd("gitui -d " .. vim.fn.expand("%:p:h")) end,
      desc = "ToggleTerm gitui",
    }
    maps.n["<leader>tg"] = maps.n[";g"]
  end
  local ipython = vim.fn.executable("ipython3") == 1 and "ipython3" or vim.fn.executable("ipython") == 1 and "ipython"
  if ipython then
    maps.n[";i"] = {
      function() utils.toggle_term_cmd(ipython) end,
      desc = "ToggleTerm ipython",
    }
    maps.n["<leader>ti"] = maps.n[";i"]
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

if is_available("project_nvim") then maps.n[",p"] = { "<cmd> Telescope projects <cr>", desc = "Telescope Project" } end
return maps
