return {
  formatting = {
    format_on_save = { enabled = false },
  },
  servers = {
    "bitbake",
  },
  config = {
    bitbake = require("user.lsp.bitbake"),
    pylsp = require("user.lsp.pylsp"),
  },
}
