local M = {}

M.go_to_next = function()
  vim.cmd('GitConflictNextConflict')
end

M.go_to_prev = function()
  vim.cmd('GitConflictPrevConflict')
end

return M
