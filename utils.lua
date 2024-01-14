local M = require("astronvim.utils")

M.joshuto = function()
  local lf_tmpfile = vim.fn.tempname()
  local path = vim.fn.expand("%:p:h")
  local args = string.format("--file-chooser --output-file %s %s", lf_tmpfile, path)
  M.toggle_term_cmd({
    cmd = "joshuto " .. args,
    direction = "float",
    on_exit = function()
      if vim.loop.fs_stat(lf_tmpfile) then
        local chosen_file = vim.fn.readfile(lf_tmpfile)[1]
        if chosen_file then
          vim.loop.new_timer():start(0, 0, vim.schedule_wrap(function() vim.cmd("edit " .. chosen_file) end))
        end
      end
    end,
  })
end

return M
