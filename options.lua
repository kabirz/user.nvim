vim.cmd([[
  au FileType c,cpp                setlocal sw=4 sts=4 ts=4 noet cc=96
  au FileType rust                 setlocal sw=4 sts=4 ts=4 et   cc=80
  au filetype python               setlocal sw=4 sts=4 ts=4 et   cc=80
  au filetype lua,json,yaml,toml   setlocal sw=2 sts=2 ts=2 et   cc=96
]])
return {
  g = {
    inlay_hints_enabled = true,
  },
}
