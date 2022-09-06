local M = {}

local function make_saga_fn(command)
  return function() vim.cmd('Lspsaga ' .. command) end
end

M.finder = make_saga_fn('lsp_finder')

M.code_actions = make_saga_fn('code_action')

M.rename = make_saga_fn('rename')

M.preview_definition = make_saga_fn('preview_definition')


M.diagnostic = {}

M.diagnostic.show_line_diagnostics = make_saga_fn('show_line_diagnostics')

M.diagnostic.go_to_next = make_saga_fn('diagnostic_jump_next')

M.diagnostic.go_to_prev = make_saga_fn('diagnostic_jump_prev')

M.hover_doc = make_saga_fn('hover_doc')


M.terminal = {}

M.terminal.open = make_saga_fn('open_floaterm')

M.toggle_outline = function()
  vim.cmd('LSoutlineToggle')
end

M.format_file = function()
  vim.lsp.buf.format({ async = true })
end

return M
