-- UI / color scheme / theme
vim.o.background = "dark"

vim.g.catppuccin_flavour = "mocha"
-- latte (light)
-- frappe (dark)
-- macchiato (darker)
-- mocha (darkest)

require("catppuccin").setup({
  term_colors = true,
  transparent_background = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = { "italic" },
    operators = {},
  },
  integrations = {
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    -- coc_nvim = false,
    lsp_trouble = true,
    cmp = true,
    lsp_saga = true,
    -- gitgutter = false,
    gitsigns = true,
    -- leap = false,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    -- neotree = {
    --   enabled = false,
    --   show_root = true,
    --   transparent_panel = false,
    -- },
    -- dap = {
    --   enabled = false,
    --   enable_ui = false,
    -- },
    fidget = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    -- dashboard = true,
    -- neogit = false,
    -- vim_sneak = false,
    -- fern = false,
    -- barbar = false,
    bufferline = true,
    markdown = true,
    -- lightspeed = false,
    -- ts_rainbow = false,
    -- hop = false,
    notify = true,
    -- telekasten = true,
    symbols_outline = true,
    mini = true,
    -- aerial = false,
    -- vimwiki = true,
    -- beacon = true,
    -- navic = false,
    -- overseer = false,
  },
})
vim.cmd([[colorscheme catppuccin]])

-- status line
local ctp_feline = require('catppuccin.groups.integrations.feline')
require('feline').setup({
  components = ctp_feline.get(),
})
require('feline').winbar.setup()

-- tabs
require('luatab').setup()

-- quickfix/location list
require('pqf').setup()

vim.notify = require('notify')

require('dressing').setup({
  select = {
    enabled = true,
    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "nui", "fzf_lua", "fzf", "builtin" },
  }
})

require('colorizer').setup(
  {
    '*'; -- Highlight all files
    '[Plugins]'; -- exclude vim plug
    css = { css = true; };
  },
  { mode = 'background' }
)

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
-- wilder.set_option('pipeline', {
--   wilder.branch(
--     wilder.cmdline_pipeline(),
--     wilder.search_pipeline()
--   ),
-- })
--
-- wilder.set_option('renderer', wilder.wildmenu_renderer({
--   highlighter = wilder.basic_highlighter(),
-- }))
