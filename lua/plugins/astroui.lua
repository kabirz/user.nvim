return {
  "AstroNvim/astroui",
  opts = function(_, opts)
    local astro = require "astrocore"

    return astro.extend_tbl(opts, {
      -- change colorscheme
      colorscheme = "dracula",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = function()
          local astroui = require "astroui"
          local get_hlgroup = astroui.get_hlgroup
          local bg = get_hlgroup("Normal").bg
          return {
            -- flash
            FlashMatch = { bg = bg, fg = "#89b4fa", bold = true, italic = true },
            FlashCurrent = { bg = bg, fg = "#04a5e5", bold = true, italic = true, underline = true },
            FlashLabel = { bg = bg, fg = "#ff007c", bold = true },
            FlashBackdrop = { bg = bg, fg = "#6c7086" },
            -- lsp inlay hint
            LspInlayHint = get_hlgroup "Comment",
            LspCodeLens = get_hlgroup "Comment",
            LspCodeLensSeparator = get_hlgroup "Comment",

            -- lsp reference
            LspReferenceRead = { bg = bg, fg = "#ff0000", bold = true, italic = true },
            LspReferenceText = { bg = bg, fg = "#AD0000", bold = true, italic = true },
            LspReferenceWrite = { bg = bg, fg = "#ff00ff", bold = true, italic = true },
          }
        end,
        astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    })
  end,
}
