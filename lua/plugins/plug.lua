local M = {}

M.install_plugins = function()
  vim.cmd('PlugInstall')
end

M.clean_uninstalled_plugins = function ()
  vim.cmd('PlugClean')
end

M.plugin_status = function ()
  vim.cmd('PlugStatus')
end

M.update_plugins = function ()
  vim.cmd('PlugUpdate')
end

M.upgrade_plug = function ()
  vim.cmd('PlugUpgrade')
end

return M
