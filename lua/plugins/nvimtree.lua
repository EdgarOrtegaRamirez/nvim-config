local M = {}

M.refresh_tree = function()
  vim.cmd('NvimTreeRefresh')
end

M.find_file = function()
  vim.cmd('NvimTreeFindFile')
end

M.toggl_tree = function()
  vim.cmd('NvimTreeToggle')
end

return M
