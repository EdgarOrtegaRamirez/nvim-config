local tabs = require('.plugins.tabs')
local nvimtree = require('.plugins.nvimtree')
local plug = require('.plugins.plug')
local git_conflict = require('.plugins.git_conflict')
local highlight = require('.plugins.highlight')
local lsp = require('.plugins.lsp')

local telescope_builtin = require('telescope.builtin')
local wk = require('which-key')
local gitsigns = require('gitsigns')
local persistence = require('persistence')

wk.setup({})

wk.register({
  K = { lsp.hover_doc, 'Hover doc', silent = true },
  ['<space>'] = {
    l = {
      name = 'LSP',
      -- f format
      -- r finder references
      -- d definition
      -- d diagnostic
      -- h hover doc/help
      -- f = { saga_finder.lsp_finder, 'Find cursor word definition and reference', silent = true, noremap = true },
      -- p = { saga_definition.preview_definition, 'Preview definition', silent = true, noremap = true },
      -- h = { saga_hover.render_hover_doc, 'Hover Doc', silent = true, noremap = true },
      -- s = { function() saga_signature.signature_help() end, 'Signature Help', silent = true, noremap = true },
      -- cd = { saga_diagnostic.show_line_diagnostics, 'Show line diagnostics', silent = true, noremap = true },
      -- ca = { function() saga_codeaction.code_action() end, 'Code Action', silent = true, noremap = true },
      t = {
        name = 'Terminal',
        o = { lsp.terminal.open, 'Open Floating terminal', silent = true },
      },
      o = { lsp.toggle_outline, 'Toggle Outline', silent = true },
      w = {
        name = 'Workspace',
        a = { vim.lsp.buf.add_workspace_folder, 'Add Workspace folder', silent = true, noremap = true },
        d = { vim.lsp.buf.remove_workspace_folder, 'Remvoe Workspace folder', silent = true, noremap = true },
        l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List Workspace folders',
          silent = true, noremap = true },
      },
    },
  },
  ['<leader>'] = {
    ['<space>'] = { highlight.no_highlight, 'No highlight' },
    l = { telescope_builtin.find_files, 'Find file' },
    f = {
      name = 'Files',
      f = { telescope_builtin.find_files, 'Find file' },
      r = { telescope_builtin.oldfiles, 'Open recent file' },
      s = { telescope_builtin.grep_string, 'Searches for the string under cursor' },
      g = { telescope_builtin.live_grep, 'Live file grep' },
    },
    s = {
      name = 'Sessions',
      r = { persistence.load, 'Restore the session for the current directory' },
      l = { function() persistence.load({ last = true }) end, 'Restore the last session' },
      s = { persistence.stop, 'Stop plugin, session will not be saved' },
    },
    g = {
      name = 'Git',
      b = { function() gitsigns.blame_line({ full = true }) end, 'Blame line' },
      d = { gitsigns.diffthis, 'Diff' },
    },
    t = {
      name = 'Tree',
      r = { nvimtree.refresh_tree, 'Refresh tree' },
      f = { nvimtree.find_file, 'Find file in tree' },
      t = { nvimtree.toggl_tree, 'Toggle tree' },
    },
    p = {
      name = 'Plug',
      i = { plug.install_plugins, 'Install plugins' },
      c = { plug.clean_uninstalled_plugins, 'Clean plugins' },
      s = { plug.plugin_status, 'Plugins status' },
      u = { plug.update_plugins, 'Update plugins' },
      U = { plug.upgrade_plug, 'Upgrade Plug (manager)' },
    },
  },
  ['[x'] = { git_conflict.go_to_prev, 'Previous Git Conflict' },
  [']x'] = { git_conflict.go_to_next, 'Next Git Conflict' },
  ['<C-n>'] = { nvimtree.toggl_tree, 'Toggle tree' },
  t = {
    name = 'Tabs / Vim-Test',
    h = { tabs.go_to_first, 'First tab', silent = true, noremap = true },
    j = { tabs.go_to_prev, 'Previous tab', silent = true, noremap = true },
    k = { tabs.go_to_next, 'Next tab', silent = true, noremap = true },
    l = { tabs.go_to_last, 'Last tab', silent = true, noremap = true },
    c = { tabs.close, 'Close tab', silent = true, noremap = true },
    n = { tabs.new, 'New tab', silent = true, noremap = true },
    ['<C-n>'] = { function() vim.cmd('TestNearest') end, 'Test nearest', silent = true, },
    ['<C-f>'] = { function() vim.cmd('TestFile') end, 'Test file', silent = true, },
    ['<C-s>'] = { function() vim.cmd('TestSuite') end, 'Test suite', silent = true, },
    ['<C-l>'] = { function() vim.cmd('TestLast') end, 'Test last', silent = true, },
    ['<C-g>'] = { function() vim.cmd('TestVisit') end, 'Test visit', silent = true, },
  },
})

-- vim-test
vim.g['test#strategy'] = 'dispatch'

local hlslens_opts = { noremap = true, silent = true }
-- local opts = { noremap = true, silent = true }
local saga_opts = { noremap = true, silent = true }

vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<cr><Cmd>lua require('hlslens').start()<cr>]],
  hlslens_opts)
vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<cr><Cmd>lua require('hlslens').start()<cr>]],
  hlslens_opts)
vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<cr>]], hlslens_opts)


-- Mappings.

-- Nvim Native LSP functions
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- some servers do not implement declaration method
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
-- vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, saga_opts)
-- vim.keymap.set('n', '<Leader>le', vim.lsp.diagnostic.show_line_diagnostics, opts)
-- vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<Leader>lq', vim.lsp.diagnostic.set_loclist, opts)

-- Definition preview
vim.keymap.set("n", "gd", lsp.preview_definition, { silent = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.definition, saga_opts)
-- format file
vim.keymap.set('n', '<space>f', lsp.format_file, saga_opts)


-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
-- vim.keymap.set("n", "gh", function() vim.cmd('Lspsaga lsp_finder') end, { silent = true })
vim.keymap.set("n", "gh", lsp.finder, { silent = true })

-- Code action
vim.keymap.set("n", "<leader>ca", lsp.code_actions, { silent = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
vim.keymap.set("n", "gr", lsp.rename, { silent = true })


-- Show line diagnostics
vim.keymap.set("n", "<leader>cd", lsp.diagnostic.show_line_diagnostics, { silent = true })

-- Show cursor diagnostic
-- vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", lsp.diagnostic.go_to_prev, { silent = true })
vim.keymap.set("n", "]e", lsp.diagnostic.go_to_next, { silent = true })

-- Outline
-- vim.keymap.set("n", "<leader>o", lsp.toggle_outline, { silent = true })

-- Hover Doc
-- vim.keymap.set("n", "K", lsp.hover_doc, { silent = true })

-- Float terminal
-- vim.keymap.set("n", "<A-d>", lsp.terminal.open, { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })

-- local saga_opts = { silent = true, noremap = true }
-- vim.keymap.set('n', '<leader>ca', saga_codeaction.code_action, saga_opts)
-- -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, saga_opts)
-- vim.keymap.set('v', '<leader>ca', function()
--   vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-U>', true, false, true))
--   saga_action.range_code_action()
-- end, saga_opts)
-- -- scroll down hover doc or scroll in definition preview
-- vim.keymap.set("n", "<C-f>", function() saga_action.smart_scroll_with_saga(1) end, { silent = true })
-- -- scroll up hover doc
-- vim.keymap.set("n", "<C-b>", function() saga_action.smart_scroll_with_saga(-1) end, { silent = true })
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, saga_opts)
