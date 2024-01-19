return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 120 },
        rope_autoimport = {
          enabled = true,
          completions = { enabled = true },
          codeactions = { enabled = true },
        },
      },
    },
  },
}
