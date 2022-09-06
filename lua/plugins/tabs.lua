local M = {}

M.go_to_first = function()
  vim.cmd('tabfirst')
end

M.go_to_last = function()
  vim.cmd('tablast')
end

M.go_to_prev = function()
  vim.cmd('tabprev')
end

M.go_to_next = function()
  vim.cmd('tabnext')
end

M.new = function()
  vim.cmd('tabnew')
end

M.close = function()
  vim.cmd('tabclose')
end

return M
