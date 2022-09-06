local lsp_colors = require('lsp-colors')
local fidget = require("fidget")
-- local lightbulb = require('nvim-lightbulb')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local lsp_saga = require('lspsaga')
local toggle_lsp_diagnostics = require('toggle_lsp_diagnostics')
local lsp_signature = require('lsp_signature')
-- local trouble = require('trouble')
-- local null_ls = require('null-ls')

local diagnostic_signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(diagnostic_signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

lsp_saga.init_lsp_saga({
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- show diagnostic source
  show_diagnostic_source = true,
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 10,
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>', next = '<C-l>' },
  max_preview_lines = 20,
  symbol_in_winbar = {
    in_custom = false, -- enable later when LSPs support documentSymbol
    enable = true,
  },
  code_action_icon = "💡",
  code_action_num_shortcut = true,
  code_action_lightbulb = {
    sign = false,
    enable = true,
    virtual_text = true,
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
})


mason_lspconfig.setup({
  ensure_installed = {},
  automatic_installation = false,
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
mason_lspconfig.setup_handlers({
  -- entry without a key is the default handler
  -- will be called for each installed server that doesn't have a dedicated handler.
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
  -- Next, targeted overrides for specific servers.
  sumneko_lua = function()
    lspconfig.sumneko_lua.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
          },
        }
      }
    })
  end,
  yamlls = function()
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
          },
        },
      }
    })
  end,
})

lsp_colors.setup({})
-- lightbulb.setup({ autocmd = { enabled = true } })

-- trouble.setup({
--   signs = {
--     error = "",
--     warning = "",
--     hint = "",
--     information = "",
--     other = "﫠"
--   },
--   use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
-- })

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.completion.spell,
--     null_ls.builtins.diagnostics.cspell.with({
--     diagnostics_postprocess = function(diagnostic)
--       diagnostic.severity = vim.diagnostic.severity["WARN"]
--     end,
--     condition = function()
--       return vim.fn.executable('cspell') > 0
--     end
--   })
--   },
-- })

toggle_lsp_diagnostics.init()
fidget.setup({
  window = {
    blend = 0,
  }
})
lsp_signature.setup()
