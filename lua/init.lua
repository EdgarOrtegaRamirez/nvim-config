-- Speed up loading Lua modules to improve startup time.
require('impatient')

-- Use comma as the leader key
vim.g.mapleader = ","

-- vim.opt.syntax = 'ON' -- enabled by default
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' } -- Completion options
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.hidden = true -- Enable background buffers
vim.opt.ignorecase = true -- Ignore case
vim.opt.joinspaces = false -- No double spaces with join
vim.opt.list = true -- Show some invisible characters
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.smartcase = true -- Do not ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.smarttab = true
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.termguicolors = true -- True color support
vim.opt.wildmode = { 'longest:full', 'full' } -- Command-line completion mode
vim.opt.wrap = false -- Disable line wrap
vim.opt.mouse = '' -- Disable mouse
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.signcolumn = 'yes' -- Always show signcolumn
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.textwidth = 120 -- Set line width
vim.opt.colorcolumn = '+1' -- Display vertical column
vim.opt.backup = false -- Disable vim backups
vim.opt.backspace = { 'indent', 'eol', 'start' } -- Make backspace work as you would expect
vim.opt.writebackup = false -- Disable vim backups
vim.opt.swapfile = false -- Disable swapfile
vim.opt.autoindent = true
vim.opt.incsearch = true -- Highlight while searching with / or ?
vim.opt.hlsearch = true -- Keep matches highlighted
vim.opt.showcmd = true -- Show already typed keys when more are expected
vim.opt.laststatus = 3 -- force the status line and tab line to always display
vim.opt.clipboard = 'unnamedplus' -- :h clipboard-unnamedplus
vim.opt.listchars = { -- Show non-printable characters
  -- eol = '¬',
  tab = '▸ ',
  trail = '·',
  nbsp = '⦸',
  extends = '»',
  precedes = '«',
}
vim.opt.updatetime = 300 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.

-- Do not source the default filetype.vim|lua, using nathom/filetype.nvim
vim.g.did_load_filetypes = 1

-- Skip some unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.shortmess:append 'c'
vim.opt.formatoptions:remove 't' -- do not automatically wrap text when typing

require('ui')

-- Debug with
-- print(vim.inspect(var))

require('numb').setup()

require('focus').setup()

require('stabilize').setup()

local gitsigns = require('gitsigns')
gitsigns.setup({})

require('Comment').setup({})

require('surround').setup({ mappings_style = 'surround' })

require('nvim-tree').setup({
  filesystem_watchers = {
    enable = true,
  },
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    group_empty = true,
    full_name = true,
    highlight_git = true,
    highlight_opened_files = 'all',
    indent_markers = {
      enable = true,
    },
    special_files = { 'Gemfile', 'Makefile', 'README.md', 'readme.md', '.node-version', '.nvmrc' },
  }
})

local telescope = require('telescope')
telescope.setup({
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({})
    },
  },
})
telescope.load_extension('fzy_native')
telescope.load_extension('ui-select')

require('indent_blankline').setup({
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    'help',
    'terminal',
    'alpha',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'Mason',
    '',
  },
  buftype_exclude = { 'terminal' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
})

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
-- end

require('mason').setup({
  ui = {
    -- Accepts same border values as |nvim_open_win()|.
    border = 'none',

    icons = {
      -- package_installed = '◍',
      -- package_pending = '◍',
      -- package_uninstalled = '◍',
      package_pending = '',
      package_installed = '',
      package_uninstalled = 'ﮊ',
    },
  },
})

require('git-conflict').setup({
  default_mappings = false, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
})

require('treesitter-context').setup({})

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or 'all'
  ensure_installed = { 'bash', 'css', 'dockerfile', 'html', 'javascript', 'json', 'json5', 'lua', 'markdown', 'ruby',
    'typescript', 'vim', 'yaml' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for 'all')
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { 'c', 'rust' },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

require('mini.cursorword').setup({
  -- Delay (in ms) between when cursor moved and when highlighting appeared
  delay = 300,
})

require('lsp')
require('completion')
require('mappings')

require('persistence').setup()
