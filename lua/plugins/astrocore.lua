return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local astro = require "astrocore"
    local joshuto = require("utils").joshuto
    local maps = opts.mappings

    if astro.is_available "neo-tree.nvim" then
      maps.n["<Leader>a"] = { "<Cmd>Neotree toggle reveal_force_cwd<CR>", desc = "Toggle Current Explorer" }
    end

    if astro.is_available "fittencode.nvim" then
      maps.i["<C-l>"] = {
        function()
          local API = require("fittencode.api").api
          if API.has_suggestions() then API.accept_all_suggestions() end
        end,
        desc = "Accept all suggestions",
      }
    end

    if astro.is_available "project.nvim" then
      maps.n["<localleader>p"] = { "<cmd> Telescope projects <cr>", desc = "Telescope Project" }
    end

    if astro.is_available "toggleterm.nvim" then
      if vim.fn.executable "joshuto" == 1 then
        maps.n["<localleader>a"] = { joshuto, desc = "ToggleTerm joshuto" }
        maps.n["<leader>ta"] = maps.n["<localleader>a"]
      end

      if vim.fn.executable "gitui" == 1 then
        maps.n["<localleader>g"] = {
          function()
            astro.toggle_term_cmd {
              cmd = "gitui -d " .. vim.fn.expand "%:p:h",
              direction = "float",
            }
          end,
          desc = "ToggleTerm gitui",
        }
        maps.n["<leader>tg"] = maps.n["<localleader>g"]
      end

      local ipython = vim.fn.executable "ipython3" == 1 and "ipython3" or vim.fn.executable "ipython" == 1 and "ipython"
      if ipython then
        maps.n["<localleader>i"] = {
          function()
            astro.toggle_term_cmd {
              cmd = ipython,
              direction = "float",
            }
          end,
          desc = "ToggleTerm ipython",
        }
        maps.n["<leader>ti"] = maps.n["<localleader>i"]
      end
    end

    return astro.extend_tbl(opts, {
      -- Configure core features of AstroNvim
      features = {
        large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitterAdd commentMore actions
        autopairs = true, -- enable autopairs at start
        cmp = true, -- enable completion at start
        diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
        highlighturl = true, -- highlight URLs at start
        notifications = true, -- enable notifications at start
      },
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        virtual_text = true,
        underline = true,
      },
      options = {
        opt = { -- vim.opt.<key>
          relativenumber = true, -- sets vim.opt.relativenumber
          number = true, -- sets vim.opt.number
          spell = false, -- sets vim.opt.spell
          signcolumn = "yes", -- sets vim.opt.signcolumn to yes
          wrap = false, -- sets vim.opt.wrap
          colorcolumn = "100", -- set vim.opt.colorcolumn
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          updatetime = 200, -- sets vim.opt.updatetime to 200
        },
      },
      mappings = {
        n = {
          ["<localleader>k"] = { "<cmd> Man <cr>", desc = "Goto manual" },
          ["<localleader>h"] = { "<cmd> hide <cr>", desc = "hide current buffer" },
          ["<localleader>o"] = { "<cmd> only <cr>", desc = "close others buffer" },
          -- line numbers
          ["<localleader>n"] = { "<cmd> set nu! <CR>", desc = "Toggle line number" },
          ["<localleader>r"] = { "<cmd> set rnu! <CR>", desc = "Toggle relative number" },

          ["<localleader>c"] = {
            "<cmd> edit " .. vim.fn.stdpath "config" .. "/init.lua <cr>",
            desc = "open user config",
          },
          ["<localleader>d"] = {
            function() vim.fn.chdir(vim.fn.expand "%:p:h") end,
            desc = "change current directory",
          },
        },
        t = {},
      },
    })
  end,
}
