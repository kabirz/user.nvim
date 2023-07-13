local maps = {}
local is_available = require("astronvim.utils").is_available

maps.n = {}
maps.n['bl'] = { "<cmd> bnext <cr>", desc = "Goto next buffer" }
maps.n["bh"] = { "<cmd> bprevious <cr>", desc = "Goto prev tab" }
maps.n["bf"] = { "<cmd> bfirst <cr>", desc = "Goto first tab" }
maps.n["be"] = { "<cmd> blast <cr>", desc = "Goto last tab" }
maps.n["bd"] = { "<cmd> bd <cr>", desc = "close current file" }
maps.n["tl"] = { "<cmd> tabnext <cr>", desc = "Goto next tab" }
maps.n["th"] = { "<cmd> tabprevious <cr>", desc = "Goto prev tab" }
maps.n["tf"] = { "<cmd> tabfirst <cr>", desc = "Goto first tab" }
maps.n["te"] = { "<cmd> tablast <cr>", desc = "Goto last tab" }
maps.n["td"] = { "<cmd> tabclose <cr>", desc = "close current tab" }
maps.n["gk"] = { "<cmd> Man <cr>", desc = "Goto manual" }
maps.n[";h"] = { "<C-w>h", desc = "Window left" }
maps.n[";l"] = { "<C-w>l", desc = "Window right" }
maps.n[";j"] = { "<C-w>j", desc = "Window down" }
maps.n[";k"] = { "<C-w>k", desc = "Window up" }
maps.n[",h"] = { "<cmd> hide <cr>", desc = "hide current buffer" }
maps.n[",o"] = { "<cmd> only <cr>", desc = "close others buffer" }
-- line numbers
maps.n[";n"] = { "<cmd> set nu! <CR>", desc = "Toggle line number" }
maps.n[";r"] = { "<cmd> set rnu! <CR>", desc = "Toggle relative number" }

maps.n[';c'] = {
  "<cmd> edit " .. vim.fn.stdpath('config') .. "/lua/user/init.lua <cr>",
  desc = "open user config"
}
maps.n[";d"] = {
  function() vim.fn.chdir(vim.fn.expand("%:p:h")) end,
  desc = "change current directory"
}

if is_available("neo-tree.nvim") then
  maps.n["<leader>a"] = {
    function()
      vim.cmd(string.format("Neotree toggle %s", vim.fn.expand("%:p:h")))
    end,
    desc = "Toggle current file neotree" }
end

if is_available("telescope.nvim") then
  maps.n[",f"] = { "<cmd> Telescope grep_string <cr>", desc = "Find strings" }
end

return maps
