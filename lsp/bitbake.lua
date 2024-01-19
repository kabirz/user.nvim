return {
  cmd = { "bitbake-language-server" },
  filetypes = { "bitbake" },
  root_dir = function(fname) return require("lspconfig.util").find_git_ancestor(fname) end,
}
