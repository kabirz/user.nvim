local get_hlgroup = require("astronvim.utils").get_hlgroup
local normal = get_hlgroup("Normal")
local bg = normal.bg

return {
  -- flash
  FlashMatch = { bg = bg, fg = "#89b4fa", bold = true, italic = true },
  FlashCurrent = { bg = bg, fg = "#04a5e5", bold = true, italic = true, underline = true },
  FlashLabel = { bg = bg, fg = "#ff007c", bold = true },
  FlashBackdrop = { bg = bg, fg = "#6c7086" },
  -- lsp inlay hint
  LspInlayHint = get_hlgroup("Comment"),
  LspCodeLens = get_hlgroup("Comment"),
  LspCodeLensSeparator = get_hlgroup("Comment"),
  -- lsp reference
  LspReferenceRead = { bg = bg, fg = "#ff0000", bold = true, italic = true },
  LspReferenceText = { bg = bg, fg = "#AD0000", bold = true, italic = true },
  LspReferenceWrite = { bg = bg, fg = "#ff00ff", bold = true, italic = true },

  NotifyBackground = { bg = "#000000" },
}
