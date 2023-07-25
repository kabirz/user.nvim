return {
  colorscheme = "dracula",
  lsp = {
    formatting = {
      format_on_save = { enabled = false },
      disabled = { "clangd" },
    },
    servers = {
      "clangd",
      "bitbake",
    },
    config = {
      bitbake = {
        cmd = { "bitbake-language-server" },
        filetypes = { "bitbake" },
        root_dir = function(fname) return require("lspconfig.util").find_git_ancestor(fname) end,
      },
      clangd = {
        capabilities = { offsetEncoding = "utf-16" },
      },
    },
  },
}
